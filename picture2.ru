import pygame
from pygame.draw import *

pygame.init()

FPS = 30
screen = pygame.display.set_mode((600, 400))

BLACK = (0, 0, 0)
PURPLE = (255, 0, 255)
WHITE = (255, 255, 255)
BEZG = (255, 228, 225)
YELLOW =  (255, 215, 0)
LIME = (0, 255, 0)
GREY = (230, 230, 250)
BLUE = (0, 255, 255)
BROWN = (105, 105, 105)
RED = (205, 92, 92)
ORANGE = (210, 105, 30)
DARKORANGE = (178, 34, 34)

#background
rect(screen, WHITE, (0, 80, 600, 270))
rect(screen, BLACK, (0, 0, 600, 50))

surf = pygame.Surface((400, 400))
surf.fill(WHITE)
surf.set_alpha(0)
screen.blit(surf, (0, 0))
pygame.display.update()
pygame.draw.circle(screen, ORANGE, (300, 310), 70)#body right
pygame.display.update()



#BOY
#face
circle(screen, BEZG, (300, 200), 60) 
#hair
polygon(screen, PURPLE, [(245,180), (255,165), (238,162)])
polygon(screen, BLACK, [(245,180), (255,165), (238,162)], 1)
polygon(screen,  PURPLE, [(253,168), (265,155), (245,148)])
polygon(screen, BLACK, [(253,168), (265,155), (245,148)], 1)
polygon(screen, PURPLE, [(263,158), (277,147), (258,136)])
polygon(screen, BLACK, [(263,158), (277,147), (258,136)], 1)
polygon(screen, PURPLE, [(275,150), (290,143), (274,128)])
polygon(screen, BLACK, [(275,150), (290,143), (274,128)], 1)
polygon(screen,  PURPLE, [(287,144), (302,141), (292,123)])
polygon(screen, BLACK, [(287,144), (302,141), (292,123)], 1)
polygon(screen,  PURPLE, [(301,142), (316,144), (309,123)])
polygon(screen, BLACK, [(301,142), (316,144), (309,123)], 1)
polygon(screen,  PURPLE, [(315,145), (331,150), (329,128)])
polygon(screen, BLACK, [(315,145), (331,150), (329,128)], 1)
polygon(screen,  PURPLE, [(343,158), (328,148), (348,136)])
polygon(screen, BLACK, [(343,158), (328,148), (348,136)], 1)
polygon(screen,  PURPLE, [(341,155), (350,168), (360,148)])
polygon(screen, BLACK, [(341,155), (350,168), (360,148)], 1)
polygon(screen, PURPLE, [(348,165), (355,180), (365,162)])
polygon(screen, BLACK, [(348,165), (355,180), (365,162)], 1)
#eyes
circle(screen, BLUE, (280, 190), 17)
circle(screen, BLACK, (280, 190), 17, 1)
circle(screen, BLACK, (280, 190), 7)
circle(screen, BLUE, (320, 190), 17)
circle(screen, BLACK, (320, 190), 17, 1)
circle(screen, BLACK, (320, 190), 7)
circle(screen, WHITE, (323, 187), 1)
circle(screen, WHITE, (284, 187), 1)
#nose
polygon(screen, BROWN, [(297, 205), (303, 205), (300, 215)])
#smile
polygon(screen, RED, [(270, 230), (330, 230), (300, 250)])
#arms
#left arm
line(screen, BEZG, [245, 280], [210, 80], 14)
polygon(screen, ORANGE, [(268, 260), (248, 234), (226, 248), (225, 280),
                        (254, 285)])
polygon(screen, DARKORANGE, [(268, 260), (248, 234), (226, 248), (225, 280),
                        (254, 285)], 1)
circle(screen, BEZG, (210, 90), 12)
#right arm
line(screen, BEZG, [350, 280], [400, 80], 14)
polygon(screen, ORANGE, [(332, 260), (352, 234), (374, 248), (375, 280),
                        (346, 285)])
polygon(screen, DARKORANGE, [(332, 260), (352, 234), (374, 248), (375, 280),
                        (346, 285)] , 1)
circle(screen, BEZG, (400, 90), 12)

#background
rect(screen, BLACK, (0, 350, 600, 50))
rect(screen, LIME, (0, 50, 600, 35))
#text
pygame.font.init()
myfont = pygame.font.SysFont('Izax MS', 34)
textsurface = myfont.render('PYTHON is AMAZING!', False, BLACK)
screen.blit(textsurface,(185,55))

pygame.display.update()
clock = pygame.time.Clock()
finished = False

while not finished:
    clock.tick(FPS)
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            finished = True
           

pygame.quit()
