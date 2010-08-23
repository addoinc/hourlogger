require 'spreadsheet'

namespace :db do

  desc "Generate xls report"
  task :report => :environment do
    book = Spreadsheet::Workbook.new
    sheet1 = book.create_worksheet
    sheet1.row(0).concat %w{Name Activity Project Date From To Hrs Remarks}
    row_count = 1
    User.all.each do |user|
      hours = Hour.find_all_by_user_id(user.id)
      hours.each do |hour|
        sheet1.row(row_count).concat([
          hour.user.login, hour.activity.name, hour.project.name, hour.log_date.strftime('%a %d %b %y'),
          hour.from.strftime("%H.%M"), hour.to.strftime("%H.%M"),
          hour.time_period(:only_hrs => true).first,
          hour.description
        ])
        row_count = row_count + 1
        book.write '/tmp/hour_log.xls'
      end
    end
  end
  
end
