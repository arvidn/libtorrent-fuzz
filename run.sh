
COMMANDLINE="-runs=9000000 -timeout=10"

function run
{
./fuzzers/${1} ${COMMANDLINE} -artifact_prefix=./${1}- corpus/${2}
}

run torrent_info torrents &
run parse_magnet_uri magnetlinks &
run bdecode_node torrents &
run lazy_bdecode torrents &
run parse_int parse_int &
run sanitize_path sanitize_path &
run escape_path escape_path &
run file_storage_add_file add_file &
run base32decode base32 &
run base32encode base32encode &
run base64encode base64encode &
run escape_string escape_string &
run gzip gzip &
run verify_encoding utf8 &
run convert_to_native utf8 &
run convert_from_native utf8 &
run utf8_wchar utf8 &
run wchar_utf8 utf8 &
run utf8_codepoint utf8 &
run http_parser http &
run upnp xml &
run dht_node dht &
run utp utp &
run resume_data resume &

wait
