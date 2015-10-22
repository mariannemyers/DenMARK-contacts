xquery version "1.0-ml";

module namespace resource = "http://marklogic.com/rest-api/resource/additional-details";

import module namespace json="http://marklogic.com/xdmp/json" at "/MarkLogic/json/json.xqy";

declare option xdmp:mapping "false";

declare function get(
$context as map:map,
$params  as map:map
) as document-node()* {
    let $guid := map:get($params, "guid")
    let $query-params :=
      map:new(map:entry("subject",
        sem:iri($guid)))

    let $result := ()


    (: We may only get one result, but we'd like to make sure it always is returned as an array :)
    let $as-array := json:to-array($result)

    return document { xdmp:to-json($as-array) }
};

declare function put(
$context as map:map,
$params  as map:map,
$input   as document-node()*
) as document-node()?  {
    document { "put" }
};

declare function post(
$context as map:map,
$params  as map:map,
$input   as document-node()*
) as document-node()* {
    document { "post" }

};

declare function delete(
$context as map:map,
$params  as map:map
) as document-node()? {
    document { "delete" }
};
