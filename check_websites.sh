
websites=(
    "https://google.com"
    "https://facebook.com"
    "https://twitter.com"
)

log_file="website_status.log"


for site in "${websites[@]}"; do

    http_code=$(curl -s -o /dev/null -w "%{http_code}" -L "$site")


    if [ "$http_code" -eq 200 ]; then
        echo "<$site> is UP" | tee -a "$log_file"
    else
        echo "<$site> is DOWN" | tee -a "$log_file"
    fi
done

echo "Результати: $log_file"
