

def amazon_size_define(item)
    #binding.pry
    str = item.feature + item.editorialreviews
    
    #全角->半角
    str = NKF.nkf('-m0Z1 -W -w', str)
    
    #不要な記号の除去
    str = str.gsub(/\(/, "")
    str = str.gsub(/\)/, "")
    str = str.gsub(/ /, "")
    puts str
    
    width = str.match(/(W[0-9.]+|幅[0-9.]+|幅:[0-9.]+)/)
    length = str.match(/(D[0-9.]+|奥行き[0-9.]+|奥行[0-9.]+|奥行き:[0-9.]+)/)
    height = str.match(/(H[0-9.]+|高[0-9.]+|高さ[0-9.]+|高さ:[0-9.]+)/) 
    p width
    p length
    p height
    binding.pry
    
    mm = str.match(/サイズ+mm/)
    p mm
    
    if !width.nil?
         width = width[1].match(/[0-9.]+/)[0] 
         p width
         item.update( width: width)
    end

    unless length.nil?
         length = length[1].match(/[0-9.]+/)[0]
         p length
         item.update( length: length)
    end
    
    unless height.nil?
         height = height[1].match(/[0-9.]+/)[0] 
         item.update( height: height)
    end

    #if !width.present? && !length.present? && height.present?
    #width = width[1].match(/[0-9.]+/)[0] ||= ""
    #length = length[1].match(/[0-9.]+/)[0] ||= "" 
    #height = height[1].match(/[0-9.]+/)[0] ||= ""
    
    #item.update( width: width , length: length, height: height)
    #end
    #user.update( name: "やっぱり鈴木", email: "suzuki@test.co.jp" )


end