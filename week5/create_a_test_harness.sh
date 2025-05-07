# get current time and store it
# loop num_reps times
#     duckdb db_file query
# end loop
# get current time
# compute elapsed time
# divide elapsed time by num_reps
# write output

current_time= "Current epoch time: $(date +%s)"