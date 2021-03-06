import pygame
from pygame.draw import *
from random import randint



pygame.init()

FPS = 20
screen = pygame.display.set_mode((600, 450))

# функция нового шарика
def new_ball(screen_ball: pygame.Surface, x_ball: int, y_ball: int, r_ball: int, color_ball: tuple):
    circle(screen_ball, color_ball, (x_ball, y_ball), r_ball)



# функция нового экстра шарика
def extra_ball(screen_eball: pygame.Surface, x_eball: int, y_eball: int):
    circle(screen_eball, color_eball, (x_eball, y_eball), r_eball)
    
    

pygame.display.update()
clock = pygame.time.Clock()
finished = False
points = 0  # счетчик очков
balls = []  
eballs = [] 
timer = 0  

r_eball = 12  
color_eball = (255, 215, 0)  


while not finished:
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            finished = True
        elif event.type == pygame.MOUSEBUTTONDOWN:
            (x_mouse, y_mouse) = event.pos  
            # условие попадание по шарам
            for ball in balls:
                if (ball[0] - x_mouse) ** 2 + (ball[1] - y_mouse) ** 2 <= ball[2] ** 2:
                    points += 1  # счетчик очеч
                    balls.remove(ball)  # пойманный шар пропадает
            for eball in eballs:
                if (eball[0] - x_mouse) ** 2 + (eball[1] - y_mouse) ** 2 <= r_eball ** 2:
                    points += 3 
                    eballs.remove(eball)  

    # вывод счетчика на экран игры
    f = pygame.font.Font(None, 36)
    text = f.render('Points: ' + str(points), 1, (180, 0, 0))
    screen.blit(text, (250, 20))

    # движение шаров
    for ball in balls:
        ball[0] += ball[4] #x+=vx
        ball[1] += ball[5] #y+=vy
        # столкновение со стенками
        if (ball[0] + ball[2] > 600) or (ball[0] - ball[2] < 0):
            ball[4] *= -1 #Vx
        if (ball[1] + ball[2] > 450) or (ball[1] - ball[2] < 0):
            ball[5] *= -1 #Vy
        
        if ball[6] < 150 and not ball[7]:
            new_ball(screen, ball[0], ball[1], ball[2], ball[3])
            ball[6] += 1
        else:
            del ball

    # движение eballov
    for eball in eballs:
        eball[0] += eball[2]
        eball[1] += eball[3]
        eball[3] += 1
        # столкновение со стенками
        if (eball[0] + r_eball > 600) or (eball[0] - r_eball < 0):
            eball[2] *= -1
        if (ball[1] + r_eball > 450) or (eball[1] - r_eball < 0):
            m_ball[3] *= -1
        
        if eball[4] < 100 and not eball[5]:
            extra_ball(screen, eball[0], eball[1])
            eball[4] += 1
        else:
            del eball


    # появление новых balls
    if timer % 10 == 0:
        x = randint(100, 500)
        y = randint(100, 350)
        r = randint(10, 100)
        dx = randint(-5, 5)
        dy = randint(-5, 5)
        lifetime = 0
        click = False
        color = (randint(0, 255), randint(0, 255), randint(0, 255))
        balls.append([x, y, r, color, dx, dy, lifetime, click])
        new_ball(screen, x, y, r, color)


    # появление новых extra balls
    if timer % 30 == 0:
        x_e = randint(100, 500)
        y_e = randint(100, 350)
        dx_e = 2 * randint(-2, 5)
        dy_e = 2 * randint(-5, 5)
        lifetime = 0
        click = False
        eballs.append([x_e, y_e, dx_e, dy_e, lifetime, click])
        extra_ball(screen, x_e, y_e)
   

    timer += 1  # счетчик времени
    pygame.display.update()
    clock.tick(FPS)
    screen.fill((0, 0, 0))  

pygame.quit()
