function dotenv(){
    export $(cat $TOOLS_PATH/.env | xargs)
}
function low(){
    echo "fuck"
}
function put(){
    local last_argument=${!#}
    echo "Transfering files to $last_argument"
    echo -e "put -r $1" | sftp -i $KEYFILE -oPort=$PORT $USERNAME@$HOST:$2
}
export -f put
export -f dotenv
export -f low