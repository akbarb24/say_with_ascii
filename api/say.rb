require 'artii'

Handler = Proc.new do |req, res|
  message = req.query['msg'] || 'World'

  res.status = 200
  res['Content-Type'] = 'text/plain'
  res.body = split_line(message)
end

def split_line(text)
  art = Artii::Base.new :font => 'letters'
  ascii_arr = Array.new

  text.split('%n%').each do |t|
    ascii_res = art.asciify(t)
    ascii_arr.push(ascii_res)
    puts ascii_res
  end

  return ascii_arr
end