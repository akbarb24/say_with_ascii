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

  text.split.each do |t|
    ascii = art.asciify(t)
    ascii_arr.push(ascii)
  end

  return ascii_arr
end