(define (chalk filename grow-pixels spread-amount percentage)
   (let* ((image (car (gimp-file-load RUN-NONINTERACTIVE filename filename)))
          (drawable (car (gimp-image-get-active-layer image)))
          (new-filename (string-append "modified_" filename)))
     (gimp-image-select-color image CHANNEL-OP-REPLACE drawable '(0 0 0))
     (gimp-selection-grow image grow-pixels)
     (gimp-context-set-foreground '(0 0 0))
     (gimp-edit-bucket-fill drawable BUCKET-FILL-FG LAYER-MODE-NORMAL 100 255 TRUE 0 0)
     (gimp-selection-none image)
     (plug-in-spread RUN-NONINTERACTIVE image drawable spread-amount spread-amount)
     (gimp-drawable-invert drawable TRUE)
     (plug-in-randomize-hurl RUN-NONINTERACTIVE image drawable percentage 1 TRUE 0)
     (gimp-file-save RUN-NONINTERACTIVE image drawable new-filename new-filename)
     (gimp-image-delete image)))