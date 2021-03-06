context("wrf_create")
dir.create(file.path(tempdir(), "EMISS"))
wrf_create(wrfinput_dir          = system.file("extdata", package = "eixport"),
            wrfchemi_dir         = file.path(tempdir(), "EMISS"),
            domains              = 2,
            frames_per_auxinput5 = 1,
            auxinput5_interval_m = 60,
            day_offset           = 1,
            verbose              = FALSE)
f1 <- paste0(file.path(tempdir(), "EMISS"),
             "/wrfchemi_d02_2011-08-02_00:00:00")
f2 <- unzip(zipfile = paste0(system.file("extdata", package = "eixport"),
                             "/wrfchemi_d02_2011-08-02.zip"),
            exdir = file.path(tempdir()))
nc1 <- ncdf4::nc_open(f1)
nc2 <- ncdf4::nc_open(f2)
test_that("wrf_create works", {
  expect_equal(nc1$nvars,
               nc2$nvars
  )
})
