(script-fu-register
    "script-fu-add-grid"                        ;func name
    "Add Grid"                                  ;menu label
    "Adds evenly spaced grid lines"             ;description
    "Janos Batik"                               ;author
    ""                                          ;copyright notice
    "October 17, 2022"                          ;date created
    ""                                          ;image type that the script works on
    SF-VALUE       "Number of grid lines"     "3"       ;number of lines
    SF-IMAGE       "Image"         0
    SF-DRAWABLE    "Current Layer" 0


  )
  (script-fu-menu-register "script-fu-add-grid" "<Image>/File/Create/Grid")

( define (script-fu-add-grid numGridLines image drawable)
    ( let* (
        ( width (car (gimp-image-width image)))
        ( height (car (gimp-image-height image)))

        ( black '(0 0 0))
        ( opacity 120)
        ( offset 0)

        ( hspace (/ height numGridLines))
        ( vspace (/ width numGridLines))
        ( lineThickness 2)

        ( plug-in-grid RUN-NONINTERACTIVE image drawable lineThickness hspace offset black opacity lineThickness vspace offset black opacity 0 0 offset black opacity)
)))