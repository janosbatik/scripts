(define (script-fu-add-grid numGridLines filename)
    (let* 
        (
            (image (car (gimp-file-load RUN-NONINTERACTIVE filename filename)))
            (drawable (car (gimp-image-get-active-layer image)))
            
            (newFilename (string-append "grid_x" (number->string numGridLines) filename))

            (width (car (gimp-image-width image)))
            (height (car (gimp-image-height image)))

            (black '(0 0 0))
            (opacity 120)
            (offset 0)

            (hspace (/ height numGridLines))
            (vspace (/ width numGridLines))
            (lineThickness 2)
        )
            (plug-in-grid RUN-NONINTERACTIVE image drawable lineThickness hspace offset black opacity lineThickness vspace offset black opacity 0 0 offset black opacity)
            (gimp-file-save RUN-NONINTERACTIVE image drawable newFilename newFilename)
            (gimp-image-delete image)
        
    )
)
