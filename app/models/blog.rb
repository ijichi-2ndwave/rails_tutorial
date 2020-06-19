class Blog < ApplicationRecord
validates :title, :content, presence: true, length: { in: 3..30 }

def self.search(search) 
  if search
      patterns = search.split(/[ ,　]/)
      sql_body = ''
      patterns.each do | pattern |
        sql_body += ' and ' unless sql_body.blank?
        sql_body += " content like '%#{pattern}%' "
      end
      sql = "select * from blogs where #{sql_body} order by id desc"
      blog_ids = Blog.find_by_sql(sql)
      ids = []
      blog_ids.each do |qi|
        ids.push(qi.id)
      end
      where(:id => ids)
    else
    Blog.all #全て表示。
  end
  end
end
