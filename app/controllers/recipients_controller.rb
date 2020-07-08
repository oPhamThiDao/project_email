class RecipientsController < ApplicationController
  def index
  end

  def create
    begin
      # create file
      file_path = save_tempfile(params[:file_csv])

      workbook = RubyXL::Parser.parse(file_path)
      worksheet = workbook.worksheets[0]
      worksheet.each_with_index do |row, i|
        next if i == 0
        UserMailer.welcome_email(row.cells.map(&:value)).deliver_later
      end
    ensure
      # delete temp file
      File.unlink file_path if File.exist? file_path
    end
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
end
