# Visualize Fibonacci x Primes, each modulo N, with R.

# Collect the election data files.
filenames <- list.files(
    '.',
    pattern = '^slice-seq-[0-9]+-[0-9]+.dat$',
    full.names = TRUE,
);

# Process the data into charts.
for (file in filenames) {
    # Get the parameters from the filename.
    seq <- sub('^slice-seq-([0-9]+)-[0-9]+\\.dat$', '\\1', file);
    mod <- sub('^slice-seq-[0-9]+-([0-9]+)\\.dat$', '\\1', file);

    # Build the chart title.
    title <- paste( 'Fibonacci x Primes to ', seq, ', modulo ', mod );

    cat(paste('Building image file for', title, '...'));

    # Read the data.
    data <- read.table(
        file,
        header = FALSE,
        nrows  = 1,
        sep    = '\t',
    );

    image_file <- paste('slice-seq-', seq, '-', mod, '.png', sep = '');

    # Open the graphics device to save our chart.
    png(image_file);

    # Render the scatter plot.
    plot(
        data$N, data$N.1,
        main = title,
        xlab = data[[1]],
        ylab = data[[2]],
    );

    # Close the graphics device.
    dev.off();

    cat(paste('Wrote image file:', image_file));
}
