var i, q;
// To decode a value, pass it to tj_decode, much like with json_decode
q = tj_decode("[1, 2, 3]");

// JSON arrays are decoded into regular GML arrays:
show_debug_message("An array: " + string(q));

// JSON objects are decoded into special array-based structures on native platforms,
// and into actual JS Objects on JS-based platforms. This means that you don't have
// destroy them after use - that is done automatically.
q = tj_decode("{ \"a\": 1, \"b\": 2 }");

// tj_get returns a field of a TJSON object, much like ds_map_find_value.
show_debug_message("q.a = " + string(tj_get(q, "a")));

// tj_set changes a field of a TJSON object.
tj_set(q, "a", 3);

// tj_size returns the number of fields that an object has.
show_debug_message("q' size: " + string(tj_size(q)));

// tj_keys returns an array containing fields of an object.
var keys = tj_keys(q);
show_debug_message("q' keys: " + string(keys));

// If you need to pick over all fields-values, you can use tj_keys+tj_get:
for (i = 0; i < array_length_1d(keys); i++) {
    show_debug_message("q." + string(keys[i]) + " = " + string(tj_get(q, keys[i])));
}

// To encode a value, pass it to tj_encode. This works for all supported types:
show_debug_message("q encoded: " + tj_encode(q));

// If you provide a second parameter, the result will be multi-line and indented:
show_debug_message("q indented: " + tj_encode(q, "    "));

// To construct arrays/objects, you can use tj_array/tj_object:
q = tj_object(
    "number", 4,
    "array", tj_array(1, 2, 3),
);
show_debug_message("custom object: " + tj_encode(q, "    "));

// JavaScript true/false false are converted into tj_true\tj_false
// to be able to tell them apart. tj_bool\tj_is_bool are also available.
q = tj_decode("true");
show_debug_message("js true == tj_true: " + string(q == tj_true));
show_debug_message("tj_false encoded: " + tj_encode(tj_false));

//
show_message("All is well! Check the compile form / output log.");
