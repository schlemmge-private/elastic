
$r = new-object -TypeName System.Random
$i = 42
while ($true) {
    [system.Threading.Thread]::Sleep([timespan]::FromMilliseconds(100))
    # between 9 and -9
    $x = 10 - ($r.next() % 19 + 1)
    $y = 10 - ($r.next() % 19 + 1)
    #$lat  = 52 - 0.1 * ($r.next() % 10)
    #$lon = 9 - 0.1 * ($r.next() % 10)
    #foreach ($x in [system.linq.Enumerable]::range(-10,20)) {
        #foreach ($y in [system.linq.Enumerable]::range(-10,20)) {
    #foreach ($p in [system.linq.Enumerable]::range(0,5)) {
    $entry = @{
            firstName= "${x}_${y}";
            dateOfBirth= ('{0:u}' -f  [datetime]::utcnow).replace(" ", "T");
            generated= ('{0:u}' -f  [datetime]::utcnow).replace(" ", "T");
            place= "Hanover";
            location= @{
                lat= (0 + 0.01 * $x)
                lon= (0 + 0.01 * $y)
            }
        };
    Invoke-WebRequest -Method post -Uri "http://localhost:9200/play/_doc/d${i}" -Body ($entry | convertto-json) -ContentType "application/json"
    $i++
    #}
        #}
    #}
}
