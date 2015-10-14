import time
import random
from world import *


### init
size = 6
world = World(size)  # make 6x6 world
alpha = 0.1
gamma = 0.9



value = np.zeros((size, size))
qvalue = np.zeros((size,size,6))


for sim_i in range(5):

    print "simulation number:", sim_i

    world.init_robot()
    while world.isgoal == False:

        px,py = world.robot_pos() # current position

        action = random.randint(0,3) # action selection (random)
        world.update( action )	     # 0:up 1:right 2:left 3:down

        qx,qy = world.robot_pos() # next position

        reward = world.reward

		#########################
		# Learning
		#########################
        value[px][py] = value[px][py]+alpha * (reward + gamma * value[qx][qy] - value[px][py])
        print "value[%s][%s] = %s" % (px,py,value[px][py])
        max = 0
        for i in range(3):
            if max < qvalue[qx][qy][i]:
                max = qvalue[qx][qy][i]
                print "%s = qvalue[%s][%s][%s]"%(max,qx,qy,i)
            #print(qvalue[px][py][action])
        qvalue[px][py][action] = qvalue[px][py][action] + alpha *(reward + gamma * max*qvalue[qx][qy][action]) - qvalue[px][py][action]

		#########################

        world.draw(1, value)

world.draw(0, value)
world.mainloop()
