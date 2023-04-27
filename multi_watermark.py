# Install PIL dan matplotlib dengan pip
from PIL import Image
from PIL import ImageFont
from PIL import ImageDraw
import matplotlib.pyplot as plt
import os

def gatherFile():
    path = os.path.expanduser('~/Pictures/Screenshots')
    array = []
    for filename in os.listdir(path):
        if os.path.isfile(os.path.join(path,filename)):
            array.append(filename)
    return array
    
def proses():
    file_loc = os.path.expanduser('~/Pictures/Screenshots')
    num_file = 0
    files = gatherFile()
    photos_count = len(files) 

    print("Process Started...")

    for i in range(photos_count) :
        path = file_loc + '/' + files[i]
        try :
            image = Image.open(path)
        except :
            print("Skipped count  : " + str(i+1))
            photos_count += 1
            num_file += 1
            continue
        watermaked_image = image.copy()
        draw = ImageDraw.Draw(watermaked_image)
        w,h = image.size
        x,y = int(w/2),int(h/2)
        if x > y :
            font_size = y
        else :
            font_size = x

        font = ImageFont.truetype("arial.ttf",int(font_size/6))

        #Adding Watermark
        draw.text((x,y),"Nama : Devan Ferrel\nNIM : 225150600111031",fill=(38,7,243),font = font,anchor = 'ms')
        plt.subplot(1,2,2)
        plt.title("white text")
        filename = os.path.expanduser('~/Pictures/Watermarked/') + str(num_file) + '.png'
        watermaked_image.save(filename)
        print("Finished count : " + str(i+1))
        try :
            os.remove(path)
        except :
            print("Error")
        num_file += 1
    
proses()
