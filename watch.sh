DIRECTORIES=(./data)
COMMAND="cosma modelize"

inotifywait -m -r -e close_write --format '%w%f' "${DIRECTORIES[@]}" | while read MODIFIED
do
  echo "Change detected in $MODIFIED"
  cd $(dirname "$0")  # Change to the script's directory (assumed as the working directory)
  $COMMAND
done

