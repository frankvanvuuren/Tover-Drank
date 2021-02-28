(var counter 1)
(var time 0)

{:draw (fn draw [message]
         (love.graphics.print "Welkom bij Drakenbloed"))
 :update (fn update [dt set-mode]
             (set time (+ time dt))
             (when (> time 3)
               (love.event.quit)))
 :keypressed (fn keypressed [key set-mode]
                 (love.event.quit))}