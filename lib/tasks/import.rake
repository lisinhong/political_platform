require 'csv'
namespace :csv do 
    task load_data: :environment do
        CSV.open('../data.csv', :row_sep => "\r\n", :col_sep => ",") do |csv|
            counter = 0
            csv.each do |row|
                if row[0].present?
                    Politician.create do |p|
                        p.name = row[0]
                        p.region = row[1]
                        p.party = row[2]
                        p.age = row[3].to_i
                        if row[4] == "男"
                            p.gender = 0
                        else
                            p.gender = 1
                        end
                        p.city = row[5]
                        p.birth = row[6]
                        p.school = row[7]
                        p.experience = row[8]
                    end           
                    
                    puts row[0]
                    potitics_data = row[9..28]
                    sleep(0.1)
                    politician = Politician.find_by(name: row[0])
                    
                    
                    potitics_data.each do |data|
                        if data.present?
                            Politic.create do |p|
                                p.description = data
                                p.politician_id = politician.id
                            end
                        end
                    end
                
                    puts counter
                    counter = counter + 1
                end
            end
        end
    end
end