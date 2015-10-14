
import Tkinter as tk
import numpy as np

class World:
	""" world class for q-learning """

	def __init__(self, size):

		self.robot_x = 0
		self.robot_y = 0

		self.reward = 0.0

		self.isgoal = False

		#### for Tk

		self.root = tk.Tk()

		self.window_width  = 600
		self.window_height = 600
		self.margin = 10
		self.box_num = size

		self.wh = (self.window_width-self.margin*2)/(self.box_num)

		self.c = tk.Canvas(self.root, width = self.window_width, height = self.window_height)

		self.robot_image = tk.PhotoImage(file = "robo.gif")

	def init_robot(self):
		self.robot_x = 0
		self.robot_y = 0
		self.isgoal  = False

	#def isgoal(self):
	#	return self.isgoal


	def robot_pos(self):
		return self.robot_x, self.robot_y

	#def reward(self):
	#	return self.reward

	def update(self, action):

		if action==0:
			self.robot_y += 1
		elif action==1:
			self.robot_x += 1
		elif action==2:
			self.robot_x -= 1
		elif action==3:
			self.robot_y -= 1

		# position limitation check
		if self.robot_x<0:
			self.robot_x = 0
		elif self.robot_x>=self.box_num:
			self.robot_x = self.box_num-1

		if self.robot_y<0:
			self.robot_y = 0
		elif self.robot_y>= self.box_num:
			self.robot_y = self.box_num-1

		# reward
		if (self.robot_x==self.box_num-1) and (self.robot_y==self.box_num-1):
			self.reward = 1.0
			self.isgoal = True
		else:
			self.reward = 0.0

	def draw(self, clear=1, val=np.zeros((6,6))):

		margin = self.margin
		box_num = self.box_num
		window_width = self.window_width
		window_height = self.window_height
		wh = self.wh
		c = self.c
		robot_image = self.robot_image

		# grid lines
		for i in range(box_num+1):
			for j in range(box_num+1):
				c.create_line(margin+wh*i, margin, margin+wh*i, window_height-margin)
				c.create_line(margin, margin+wh*i, window_width-margin, margin+wh*i)

		# value
		for i in range(box_num):
			for j in range(box_num):
				x = margin + wh*i
				y = margin + wh*j

				value = 255-int(val[i][j]/1.0*255.0)
				if value>255:
					value = 255
				elif value<0:
					value = 0
				tk_rgb = "#%02x%02x%02x" % (255, value, value)

				text_val = str(val[i][j])
				c.create_rectangle(x,y,x+wh, y+wh, fill = tk_rgb)
				c.create_text(x+20,y+20, text = text_val, font=("Times", 14))

		# robot
		x = margin+40+ self.robot_x*wh
		y = margin+40+ self.robot_y*wh
		c.create_image(x, y, image = robot_image)


		c.pack()
		c.update()
		c.after(30) # execution pauase 50msec
		if clear==1:
			c.delete(tk.ALL)


	def mainloop(self):
		self.root.mainloop()

