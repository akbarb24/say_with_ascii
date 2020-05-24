require 'artii'

art = Artii::Base.new :font => 'letters'

Handler = Proc.new do |req, res|
  message = req.query['msg'] || 'World'

  res.status = 200
  res['Content-Type'] = 'text/plain'
  res.body = art.asciify(message)
end