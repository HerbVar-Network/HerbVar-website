
```{r setup, include=FALSE}
library(blastula)


<!-- https://pkgs.rstudio.com/blastula/ -->
  
  # Get a nicely formatted date/time string
  date_time <- add_readable_time()
  
  # Create an image string using an on-disk
  # image file
  img_file_path <-"./photos/herb_collage.png"
  
  img_string <- add_image(file = img_file_path)
  
  
  
  
  
  
  email <-
    compose_email(
      body = md(glue::glue(
        "Hello,

 test with photo:
{img_string}
")),
      footer = md(glue::glue("Email sent on {date_time}."))
    )
  
  
  
  # Preview the email
  email
  
  
  create_smtp_creds_file(
    "gmail_creds",
    user = "embruna@gmail.com",
    provider = "gmail",
  )
  
  email %>%
    smtp_send(
      to = "embruna@ufl.edu",
      from = "embruna@gmail.com",
      subject = "Testing the `smtp_send()` function",
      credentials = creds_file("gmail_creds")
    )
  
  