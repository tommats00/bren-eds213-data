

DB_FILE="big-fat.sqlite3"
CSV_FILE="results.csv"
QUERY="SELECT Nest_ID FROM Bird_nests WHERE Site = 'nome' AND Species = 'ruff' AND Year = 1983 AND Observer = 'cbishop' AND ageMethod = 'float';"

# Control Index 
./query_experiment.sh "none" "$QUERY" "$DB_FILE" "$CSV_FILE" "" ""

# Single-column indexes
for col in Site Species Year Observer ageMethod; do
    distinct_query="SELECT COUNT(DISTINCT $col) FROM Bird_nests;"
    ./query_experiment.sh "$col" "$QUERY" "$DB_FILE" "$CSV_FILE" "$col" "$distinct_query"
done

# Two/Three Coolumn Indexes
declare -a combos=(
    "Site,Species"
    "Site,Observer"
    "Species,Observer"
    "Year,Observer"
    "Observer,ageMethod"
    "Site,Species,Observer"
    "Year,Observer,ageMethod"
    "Site,Species,ageMethod"
    "Site,Observer,ageMethod"
)

# For loop for combo indexes 
for combo in "${combos[@]}"; do
    columns_concat=$(echo "$combo" | sed "s/,/ || ', ' || /g")
    distinct_query="SELECT COUNT(DISTINCT $columns_concat) FROM Bird_nests;"
    ./query_experiment.sh "\"$combo\"" "$QUERY" "$DB_FILE" "$CSV_FILE" "$combo" "$distinct_query"
done

