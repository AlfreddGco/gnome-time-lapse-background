#!usr/bin/python3.5
import cv2
vidcap = cv2.VideoCapture('time-lapse/City.mp4')
success, image = vidcap.read()
count = 0
success = True
while success:
	success, image = vidcap.read()
	cv2.imwrite("images/%d.jpg" % count, image)
	print('Reading a new frame: ', success)
	count += 1
print("Everything working :)")
