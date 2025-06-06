# Part 2: Experiment


# Inputs from command line
label=$1
query=$2
sql_file=$3
csv_file=$4
index_columns=$5
num_values_query=$6

# Drop existing index
sqlite3 "$sql_file" "DROP INDEX IF EXISTS idx_temp;"

# Create index if columns provided
if [ -n "$index_columns" ]; then
    sqlite3 "$sql_file" "CREATE INDEX idx_temp ON Bird_nests ($index_columns);"
fi

# Calculate distinct count
if [ "$label" == "none" ] && [ -z "$num_values_query" ]; then
    distinct_count=1
else
    if [ -n "$num_values_query" ]; then
        distinct_count=$(sqlite3 "$sql_file" "$num_values_query")
    else
        distinct_count=$(sqlite3 "$sql_file" "SELECT COUNT(DISTINCT $index_columns) FROM Bird_nests;")
    fi
fi

# Time the query in nanoseconds
start_time=$(date +%s%N)
sqlite3 "$sql_file" "$query" > /dev/null
end_time=$(date +%s%N)

elapsed_ns=$((end_time - start_time))
average_time=$(awk "BEGIN { printf \"%.3f\", $elapsed_ns / 1000000000 }")


# Write CSV header if not exists
if [ ! -f "$csv_file" ]; then
    echo "label,avg_query_time,num_distinct_values" > "$csv_file"
fi

# Append results to csv
echo "\"$label\",$average_time,$distinct_count" >> "$csv_file"

# Drop index again to clean up
if [ -n "$index_columns" ]; then
    sqlite3 "$sql_file" "DROP INDEX IF EXISTS idx_temp;"
fi


