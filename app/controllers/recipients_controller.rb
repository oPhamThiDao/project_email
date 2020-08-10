class RecipientsController < ApplicationController
  def index
  end

  def create
    @index = nil
    begin
      # create file
      file_path = save_tempfile(params[:file_csv])

      workbook = RubyXL::Parser.parse(file_path)
      worksheet = workbook.worksheets[0]
      worksheet.each_with_index do |row, i|
        next if i == 0
        @index = i + 1
        values = row.cells.map { |c| c.try(:value) }
        check_params!(values)
        UserMailer.welcome_email(values).deliver_later
      end
    ensure
      # delete temp file
      File.unlink file_path if File.exist? file_path
    end
    redirect_to recipients_path
  rescue => e
    flash.alert = "[Line - #{@index}] Error: #{e.message}"
    redirect_to recipients_path
  end

  private

  def save_tempfile(file)
    name = 'tmp/' + Time.now.strftime("%Y%m%d%H%M%S") + '_' + file.original_filename
    File.open(name, 'wb') { |f|
      f.write(file.read)
    }
    return name
  end

  def check_params!(values)
    errors = []
    indexs = [0, 2, 7, 14]
    titles = ["Email", "Họ và tên", "Lương", "Tổng"]
    indexs.each do |id|
      if values[id].blank?
        errors << titles[indexs.index(id)]
      end
    end
    if errors.present?
      raise "Bạn chưa điền thông tin cho cột #{errors.join(", ")}"
    end
  end
end
