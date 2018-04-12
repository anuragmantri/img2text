import json
import urllib

data = json.load(open('finalData1.json'))

prefix = "http://cemma.usc.edu/images/"
count = 0

captions_file = open('WORK_SPACE/UFO1200/UFO1200_text/UFO1200.token.txt', 'a')

print 'Downloading images to WORK_SPACE/UFO1200/UFO1200_Dataset/ ....'

for jsonfile in data[u'new_obj']:
        count += 1

        if(count % 500 == 0):
                print str(count) + ' images downloaded. ' + str(len(data[u'new_obj']) - count) + ' images remaining.'

        urllib.urlretrieve(prefix + jsonfile[u'imange_name'], 'WORK_SPACE/UFO1200/UFO1200_Dataset/' + jsonfile[u'imange_name'])

        captions_file.write(jsonfile[u'imange_name'] + '#0' + ' ' + jsonfile[u'text_caption'] + '\n')


print 'ALL IMAGES DOWNLOADED'
print 'CAPTIONS EXTRACTED TO WORK_SPACE/UFO1200/UFO1200_text/UFO1200.token.txt...'

