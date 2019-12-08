{
    "id": "bb005044-155b-4276-84c6-327b09d4e3a5",
    "modelName": "GMExtension",
    "mvc": "1.0",
    "name": "TJSON",
    "IncludedResources": [
        "Scripts\\scr_tjson_demo",
        "Rooms\\rm_tjson_demo",
        "Included Files\\tjson-doc.html"
    ],
    "androidPermissions": [
        
    ],
    "androidProps": true,
    "androidactivityinject": "",
    "androidclassname": "",
    "androidinject": "",
    "androidmanifestinject": "",
    "androidsourcedir": "",
    "author": "",
    "classname": "",
    "copyToTargets": 105554172285166,
    "date": "2019-38-13 09:08:33",
    "description": "",
    "extensionName": "",
    "files": [
        {
            "id": "39901c0d-839b-4d3a-895c-fc8e57575966",
            "modelName": "GMExtensionFile",
            "mvc": "1.0",
            "ProxyFiles": [
                
            ],
            "constants": [
                {
                    "id": "6b331701-af3d-48e9-ba1d-a95c71da36ca",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "tj_error_text",
                    "hidden": false,
                    "value": "g_tj_error_text"
                },
                {
                    "id": "ddaada2f-b97f-4743-afcc-cc8e7751c335",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "tj_true",
                    "hidden": false,
                    "value": "g_tj_true"
                },
                {
                    "id": "11763586-a11b-4180-9e73-200fa4dcb6ab",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "tj_false",
                    "hidden": false,
                    "value": "g_tj_false"
                },
                {
                    "id": "f79ca420-3680-43e8-bfd2-a254552a10b3",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "tj_error",
                    "hidden": false,
                    "value": "g_tj_error"
                },
                {
                    "id": "7c46a054-0bc0-4bb3-8831-e806c286dc44",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "tj_null",
                    "hidden": false,
                    "value": "undefined"
                },
                {
                    "id": "3d049a93-a39b-42ed-b117-1a0d2061b2fa",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "tj_separator",
                    "hidden": true,
                    "value": "chr(27)"
                },
                {
                    "id": "b830e04d-70d9-45c0-a6b5-a437aab2b420",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "tj_type_undefined",
                    "hidden": false,
                    "value": "0"
                },
                {
                    "id": "2b846dc8-f4a3-488a-9d19-025a8bf2755a",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "tj_type_boolean",
                    "hidden": false,
                    "value": "1"
                },
                {
                    "id": "06d36b13-a22e-41e2-ac19-93041e3c7ef0",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "tj_type_number",
                    "hidden": false,
                    "value": "2"
                },
                {
                    "id": "8a0a6298-d02e-4290-8ae0-90b9ac7c0f31",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "tj_type_string",
                    "hidden": false,
                    "value": "3"
                },
                {
                    "id": "903e9aa4-8ffa-4410-89ec-2788b90f8f0e",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "tj_type_array",
                    "hidden": false,
                    "value": "4"
                },
                {
                    "id": "5cf452f8-1674-420d-be0a-6f1c26e6bd74",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "tj_type_object",
                    "hidden": false,
                    "value": "5"
                },
                {
                    "id": "29c5a155-c389-415a-a39c-8c456a770697",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "tj_type_error",
                    "hidden": false,
                    "value": "6"
                },
                {
                    "id": "be89722e-5e03-4ea2-9490-607ebcb14179",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "tj_key_sep",
                    "hidden": true,
                    "value": "27"
                },
                {
                    "id": "d9c88676-6948-47f0-9143-fb462ea08d3a",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "tj_key_true",
                    "hidden": true,
                    "value": "35554"
                },
                {
                    "id": "c8c88d7c-3c5f-4cbb-8f02-4f188790235c",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "tj_key_false",
                    "hidden": true,
                    "value": "35554"
                },
                {
                    "id": "bb1cc62c-10a2-4770-8950-694a0f2e7aaf",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "tj_key_null",
                    "hidden": true,
                    "value": "37090"
                },
                {
                    "id": "ea8e279d-b211-4d61-8ef9-50e8e83bac35",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "tj_key_number",
                    "hidden": true,
                    "value": "35554"
                },
                {
                    "id": "efaa3cde-7883-425a-a320-416108757426",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "tj_type_unknown",
                    "hidden": false,
                    "value": "7"
                },
                {
                    "id": "98f7d8ac-797d-46d8-84dc-ec317f631715",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "tj_decode_esc",
                    "hidden": true,
                    "value": "92"
                }
            ],
            "copyToTargets": 113497714200782,
            "filename": "tjson-native.gml",
            "final": "",
            "functions": [
                {
                    "id": "ae163d68-9a52-4ca1-bb0c-42af116d542e",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "tj_init_gml",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "tj_init_gml",
                    "returnType": 2
                },
                {
                    "id": "fe428df0-f7d1-46da-b7e8-c711cd125a35",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 4,
                    "args": [
                        2,
                        2,
                        2,
                        2
                    ],
                    "externalName": "tj_stringbuf_add_sub",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "tj_stringbuf_add_sub",
                    "returnType": 2
                },
                {
                    "id": "3eb83a28-3526-407b-a95a-2e057ffd9421",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "tj_stringbuf_to_string",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "tj_stringbuf_to_string",
                    "returnType": 2
                },
                {
                    "id": "9ba61065-1894-4211-9b83-4f9622e2acc2",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "tj_opt_value_keys",
                    "help": "tj_opt_value_keys(?allow:bool)->bool : [native-only] Returns\/changes whether keys can be non-string (non-spec-compliant)",
                    "hidden": false,
                    "kind": 11,
                    "name": "tj_opt_value_keys",
                    "returnType": 2
                },
                {
                    "id": "c2371e1f-6755-42b2-bbfd-0882e15ddcf5",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "tj_uxchar",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "tj_uxchar",
                    "returnType": 2
                },
                {
                    "id": "6f26f1e1-067c-4deb-a9db-015dd11cdd08",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "tj_decode_string",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "tj_decode_string",
                    "returnType": 2
                },
                {
                    "id": "3684a320-41ad-4e94-b86b-370a1a217532",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "tj_decode_number",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "tj_decode_number",
                    "returnType": 2
                },
                {
                    "id": "4be2587e-5de6-4802-b81b-f784c1e57033",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "tj_decode_value",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "tj_decode_value",
                    "returnType": 2
                },
                {
                    "id": "e0363a8b-eb5f-4c2b-bca8-2b0ff00f8f32",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "tj_decode",
                    "help": "tj_decode(json:string)->TjValue",
                    "hidden": false,
                    "kind": 11,
                    "name": "tj_decode",
                    "returnType": 2
                },
                {
                    "id": "8ae75609-c263-4819-9f11-b3b684c53c6a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 2,
                    "args": [
                        2,
                        2
                    ],
                    "externalName": "tj_encode_string",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "tj_encode_string",
                    "returnType": 2
                },
                {
                    "id": "40749a96-b823-443a-9bb2-968de9b5d2cc",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 4,
                    "args": [
                        2,
                        2,
                        2,
                        2
                    ],
                    "externalName": "tj_encode_value",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "tj_encode_value",
                    "returnType": 2
                },
                {
                    "id": "15eb1298-aa79-48c7-b9fc-ed92394f071b",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "tj_encode",
                    "help": "tj_encode(value:TjValue, ?indent:string)->string",
                    "hidden": false,
                    "kind": 11,
                    "name": "tj_encode",
                    "returnType": 2
                },
                {
                    "id": "7f3268b6-6e7d-4f86-9a3c-beabba6786ec",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "tj_source__new",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "tj_source__new",
                    "returnType": 2
                },
                {
                    "id": "325b6a33-e579-414b-bfd6-0bbc953a6e2c",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 3,
                    "args": [
                        2,
                        2,
                        2
                    ],
                    "externalName": "tj_source_sub",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "tj_source_sub",
                    "returnType": 2
                },
                {
                    "id": "67a2b912-901a-4f35-9776-b69489ebcced",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "tj_is_array",
                    "help": "tj_is_array(q:dynamic)->bool : Returns whether a value is a TJSON array",
                    "hidden": false,
                    "kind": 11,
                    "name": "tj_is_array",
                    "returnType": 2
                },
                {
                    "id": "e2ad4fa2-edb8-460d-8a66-857145fb7ab7",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "tj_is_object",
                    "help": "tj_is_object(q:dynamic)->bool : Returns whether a value is a TJSON object",
                    "hidden": false,
                    "kind": 11,
                    "name": "tj_is_object",
                    "returnType": 2
                },
                {
                    "id": "511b9b83-91e9-412d-ae15-0e3c10a227fd",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "tj_magic_value",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "tj_magic_value",
                    "returnType": 2
                },
                {
                    "id": "3ecde8f4-6921-43b6-8388-99364de961c8",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "tj_bool",
                    "help": "tj_bool(v:bool)->TjValue",
                    "hidden": false,
                    "kind": 11,
                    "name": "tj_bool",
                    "returnType": 2
                },
                {
                    "id": "61614b27-ae47-47dd-a722-e9c2f9dac450",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "tj_is_bool",
                    "help": "tj_is_bool(v:TjValue)->bool",
                    "hidden": false,
                    "kind": 11,
                    "name": "tj_is_bool",
                    "returnType": 2
                },
                {
                    "id": "3e0dd587-3576-4810-9f4f-8eb2b1734dbd",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "tj_typeof",
                    "help": "tj_typeof(q:TjValue)->string : Returns a type of given TJSON value as string.",
                    "hidden": false,
                    "kind": 11,
                    "name": "tj_typeof",
                    "returnType": 2
                },
                {
                    "id": "69348690-35f9-4f04-9246-b7e47e09f86a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "tj_typeid",
                    "help": "tj_typeid(q:TjValue)->string : Returns a type of given TJSON value as tj_type.",
                    "hidden": false,
                    "kind": 11,
                    "name": "tj_typeid",
                    "returnType": 2
                },
                {
                    "id": "3f605228-69c7-4101-8266-f57743c61225",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "tj_object_empty_init",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "tj_object_empty_init",
                    "returnType": 2
                },
                {
                    "id": "454f0b04-3159-4323-87e2-0beb10824125",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "tj_object",
                    "help": "tj_object(...key_value_pairs:TjValue)->TjValue : Creates a TJSON object from pairs of provided keys and values",
                    "hidden": false,
                    "kind": 11,
                    "name": "tj_object",
                    "returnType": 2
                },
                {
                    "id": "ce236628-458e-4997-b01a-d57377092bfd",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "tj_array",
                    "help": "tj_array(...values:TjValue)->array<TjValue> : Crates an TJSON array from the provided arguments.",
                    "hidden": false,
                    "kind": 11,
                    "name": "tj_array",
                    "returnType": 2
                },
                {
                    "id": "296d39ae-52c2-4cf0-bb0f-7e37b022fc99",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 2,
                    "args": [
                        2,
                        2
                    ],
                    "externalName": "tj_get",
                    "help": "tj_get(q:TjValue, key:string)->TjValue : Retrieves a field out of a TJSON object.",
                    "hidden": false,
                    "kind": 11,
                    "name": "tj_get",
                    "returnType": 2
                },
                {
                    "id": "2c3116a7-fbb2-495d-8986-5fbaf28ee3c1",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 3,
                    "args": [
                        2,
                        2,
                        2
                    ],
                    "externalName": "tj_set",
                    "help": "tj_set(q:TjValue, key:string, val:TjValue) : Changes a field in the given TJSON object.",
                    "hidden": false,
                    "kind": 11,
                    "name": "tj_set",
                    "returnType": 2
                },
                {
                    "id": "cf4a78b2-8e4b-43c7-8471-fd11a51994a0",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "tj_size",
                    "help": "tj_size(q:TjValue)->int : Returns the number of fields on given TJSON object, 0 if it isn't an object.",
                    "hidden": false,
                    "kind": 11,
                    "name": "tj_size",
                    "returnType": 2
                },
                {
                    "id": "f81b8bf2-dd18-4020-9279-f5ad0e9da5d5",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "tj_keys",
                    "help": "tj_keys(q:TjValue)->array<string> : Returns an array containing the fields of the given TJSON object.",
                    "hidden": false,
                    "kind": 11,
                    "name": "tj_keys",
                    "returnType": 2
                },
                {
                    "id": "df0936c2-dd86-4c20-a892-644e786b08e1",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 2,
                    "args": [
                        2,
                        2
                    ],
                    "externalName": "tj_compare",
                    "help": "tj_compare(a:TjValue, b:TjValue)->bool : Recursively compares whether the two values match.",
                    "hidden": false,
                    "kind": 11,
                    "name": "tj_compare",
                    "returnType": 2
                },
                {
                    "id": "832c8e13-5ca9-40c4-a53a-7ec2173019a4",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 2,
                    "args": [
                        2,
                        2
                    ],
                    "externalName": "tj_encode_float",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "tj_encode_float",
                    "returnType": 2
                },
                {
                    "id": "3d71f48c-62f3-432f-83dc-697a5dfa96fb",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 2,
                    "args": [
                        2,
                        2
                    ],
                    "externalName": "tj_object_wkey",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "tj_object_wkey",
                    "returnType": 2
                },
                {
                    "id": "2b47db59-8767-4721-b6e2-780ae35f81b7",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "tj_decode_uxchar",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "tj_decode_uxchar",
                    "returnType": 2
                },
                {
                    "id": "1670b824-0920-4d29-8cd9-23f3a2b686c7",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "tj_decode_main",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "tj_decode_main",
                    "returnType": 2
                },
                {
                    "id": "796e42fd-773d-49bb-9f81-d6a9c52bc711",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 2,
                    "args": [
                        2,
                        2
                    ],
                    "externalName": "tj_encode_number",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "tj_encode_number",
                    "returnType": 2
                },
                {
                    "id": "283b2ac9-cf13-4160-82b1-b94278cf230b",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 2,
                    "args": [
                        2,
                        2
                    ],
                    "externalName": "tj_encode_main",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "tj_encode_main",
                    "returnType": 2
                },
                {
                    "id": "dd4cc44d-a467-4a1b-a365-69ce88e62329",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "tj_copy",
                    "help": "tj_copy(val:TjValue)->TjValue : Recursively copies the given TJSON value and returns it",
                    "hidden": false,
                    "kind": 11,
                    "name": "tj_copy",
                    "returnType": 2
                },
                {
                    "id": "6ffa4e6a-f65e-479f-b37e-e3e132efcdee",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 2,
                    "args": [
                        2,
                        2
                    ],
                    "externalName": "tj_stringbuf_add_key",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "tj_stringbuf_add_key",
                    "returnType": 2
                },
                {
                    "id": "1ae05ffa-ca79-41f5-9f10-39f677f27e18",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "tj_object_empty_lookup_init",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "tj_object_empty_lookup_init",
                    "returnType": 2
                },
                {
                    "id": "b39beedd-a85e-4dbd-83b3-0da5efaa260f",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 2,
                    "args": [
                        2,
                        2
                    ],
                    "externalName": "tj_delete",
                    "help": "tj_delete(q:TjValue, key:string) : Removes a field from a TJSON object (note: not fast)",
                    "hidden": false,
                    "kind": 11,
                    "name": "tj_delete",
                    "returnType": 2
                },
                {
                    "id": "ab9c7d17-dab7-4800-94d0-1b3823ac73ae",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "tj_opt_ident_keys",
                    "help": "tj_opt_ident_keys(?allow:bool)->bool : [native-only] Returns\/changes whether keys can be unquoted (non-spec-compliant)",
                    "hidden": false,
                    "kind": 11,
                    "name": "tj_opt_ident_keys",
                    "returnType": 2
                }
            ],
            "init": "tj_init_gml",
            "kind": 2,
            "order": [
                
            ],
            "origname": "tjson-native.gml",
            "uncompress": false
        },
        {
            "id": "d2913064-c2aa-4a66-8301-9b38e6562197",
            "modelName": "GMExtensionFile",
            "mvc": "1.0",
            "ProxyFiles": [
                
            ],
            "constants": [
                {
                    "id": "89ef596e-de94-4ee5-b40c-6373882a5d6f",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "tj_error_text",
                    "hidden": true,
                    "value": "tj_get_error_text()"
                }
            ],
            "copyToTargets": 98336,
            "filename": "tjson-web.js",
            "final": "",
            "functions": [
                {
                    "id": "e25b332e-9e9c-4984-9cf3-09022e44b074",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "tj_get_error_value",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "tj_get_error_value",
                    "returnType": 2
                },
                {
                    "id": "831ffaea-a8cb-439b-bfde-d0dcf0174151",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "tj_get_error_text",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "tj_get_error_text",
                    "returnType": 2
                },
                {
                    "id": "773721c6-3f4f-40ff-8c63-b8d1fdb5fcb6",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "tj_get_null_value",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "tj_get_null_value",
                    "returnType": 2
                },
                {
                    "id": "0c53d9b8-0de4-43bf-a6a6-69e5f9740598",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "tj_bool",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "tj_bool",
                    "returnType": 2
                },
                {
                    "id": "a84f9ae9-0669-46c5-b4fc-05a84d9d4a4f",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "tj_is_bool",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "tj_is_bool",
                    "returnType": 2
                },
                {
                    "id": "c901de7d-2ae3-4e22-bc73-3a3f8419585a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "tj_object",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "tj_object",
                    "returnType": 2
                },
                {
                    "id": "a1364bee-9f8b-4e6c-bb87-aa84236e318c",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "tj_array",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "tj_array",
                    "returnType": 2
                },
                {
                    "id": "87c0be3e-dc63-449f-8cee-32a91da1e862",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "tj_is_object",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "tj_is_object",
                    "returnType": 2
                },
                {
                    "id": "cdbdc565-1e9f-4514-a041-ae01fedaef78",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "tj_is_array",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "tj_is_array",
                    "returnType": 2
                },
                {
                    "id": "cd40c3cd-b748-471d-87d9-c4959ce12d0f",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 2,
                    "args": [
                        2,
                        2
                    ],
                    "externalName": "tj_get",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "tj_get",
                    "returnType": 2
                },
                {
                    "id": "9ae055e3-63c1-430c-b250-6656889f4602",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 3,
                    "args": [
                        2,
                        2,
                        2
                    ],
                    "externalName": "tj_set",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "tj_set",
                    "returnType": 2
                },
                {
                    "id": "59a795d2-60f0-4c9a-ba13-51a66690e10c",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "tj_size",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "tj_size",
                    "returnType": 2
                },
                {
                    "id": "6092189d-8c46-49da-98bc-9529cd3f4401",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "tj_keys",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "tj_keys",
                    "returnType": 2
                },
                {
                    "id": "0100d6ca-4abd-4e80-8557-e5dc86045f2e",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "tj_typeof",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "tj_typeof",
                    "returnType": 2
                },
                {
                    "id": "9be77de5-bdcf-4c63-b616-a2474c607bfb",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "tj_typeid",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "tj_typeid",
                    "returnType": 2
                },
                {
                    "id": "228dd8c2-66cd-4d8d-9a0e-aae9d9f0cdc1",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 2,
                    "args": [
                        2,
                        2
                    ],
                    "externalName": "tj_compare",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "tj_compare",
                    "returnType": 2
                },
                {
                    "id": "1a0d069b-d6c3-4183-a3ff-3f0b2715b8ff",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "tj_decode",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "tj_decode",
                    "returnType": 2
                },
                {
                    "id": "a3f21cf9-c556-4ef4-8fd8-58521fd60d3a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "tj_encode",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "tj_encode",
                    "returnType": 2
                },
                {
                    "id": "e522be9a-894a-4bea-b1ee-b11eec03d292",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "tj_init_js",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "tj_init_js",
                    "returnType": 2
                },
                {
                    "id": "1509eb6d-4514-4a4b-afa3-73835cf24e7a",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 2,
                    "args": [
                        2,
                        2
                    ],
                    "externalName": "tj_delete",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "tj_delete",
                    "returnType": 2
                },
                {
                    "id": "8af95207-c3e5-4c03-8759-d2d148db3e8d",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        2
                    ],
                    "externalName": "tj_copy",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "tj_copy",
                    "returnType": 2
                },
                {
                    "id": "559fe70f-d60d-446f-a0fa-55580ae17c66",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "tj_opt_value_keys",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "tj_opt_value_keys",
                    "returnType": 2
                },
                {
                    "id": "5365a392-fda1-4bcb-8b8e-237b274ad8ea",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "tj_opt_ident_keys",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "tj_opt_ident_keys",
                    "returnType": 2
                }
            ],
            "init": "tj_init_js",
            "kind": 5,
            "order": [
                
            ],
            "origname": "extensions\\tjson-web.js",
            "uncompress": false
        },
        {
            "id": "c86db63d-5844-483c-869d-bc4392bd87da",
            "modelName": "GMExtensionFile",
            "mvc": "1.0",
            "ProxyFiles": [
                
            ],
            "constants": [
                {
                    "id": "53f1e58b-1f06-4f8e-ba23-ec654f63bcf0",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "tj_true",
                    "hidden": true,
                    "value": "(global.g_tj_true)"
                },
                {
                    "id": "280ed321-3cba-4f88-8889-5c8352e537f8",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "tj_false",
                    "hidden": true,
                    "value": "(global.g_tj_false)"
                },
                {
                    "id": "acac407d-d113-4010-b9ad-e4b81136bdc7",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "tj_null",
                    "hidden": true,
                    "value": "(global.g_tj_null)"
                },
                {
                    "id": "aa320755-d2d3-47e2-84a1-b751f1876a80",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "tj_error",
                    "hidden": true,
                    "value": "(global.g_tj_error)"
                },
                {
                    "id": "2bc4288a-7558-489b-8c8b-00cf65a7038f",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "tj_type_undefined",
                    "hidden": true,
                    "value": "0"
                },
                {
                    "id": "7d543120-6daf-4144-8870-1d4f2d26eb9b",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "tj_type_boolean",
                    "hidden": true,
                    "value": "1"
                },
                {
                    "id": "d57e53f3-5251-4eb6-b1da-f727e988aff4",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "tj_type_number",
                    "hidden": true,
                    "value": "2"
                },
                {
                    "id": "98c63437-ee7e-46ff-8508-9ae9ffc50fbf",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "tj_type_string",
                    "hidden": true,
                    "value": "3"
                },
                {
                    "id": "c394379f-67ce-43cc-a000-cf207a952c04",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "tj_type_array",
                    "hidden": true,
                    "value": "4"
                },
                {
                    "id": "390de033-8257-4edd-8a75-3273ce0a2e54",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "tj_type_object",
                    "hidden": true,
                    "value": "5"
                },
                {
                    "id": "a1db170b-ba2c-4bc3-ab8b-10edb5ac9f8c",
                    "modelName": "GMExtensionConstant",
                    "mvc": "1.0",
                    "constantName": "tj_type_error",
                    "hidden": true,
                    "value": "6"
                }
            ],
            "copyToTargets": 98336,
            "filename": "tjson-web.gml",
            "final": "",
            "functions": [
                {
                    "id": "de702606-dc36-4ae0-8b13-b8d41916b560",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "tj_init_js_gml",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "tj_init_js_gml",
                    "returnType": 2
                }
            ],
            "init": "tj_init_js_gml",
            "kind": 2,
            "order": [
                
            ],
            "origname": "extensions\\gml.gml",
            "uncompress": false
        }
    ],
    "gradleinject": "",
    "helpfile": "",
    "installdir": "",
    "iosProps": true,
    "iosSystemFrameworkEntries": [
        
    ],
    "iosThirdPartyFrameworkEntries": [
        
    ],
    "iosplistinject": "",
    "license": "Free to use, also for commercial games.",
    "maccompilerflags": "",
    "maclinkerflags": "",
    "macsourcedir": "",
    "packageID": "cc.yal.tjson",
    "productID": "ACBD3CFF4E539AD869A0E8E3B4B022DD",
    "sourcedir": "",
    "tvosProps": false,
    "tvosSystemFrameworkEntries": [
        
    ],
    "tvosThirdPartyFrameworkEntries": [
        
    ],
    "tvosclassname": "",
    "tvosmaccompilerflags": "",
    "tvosmaclinkerflags": "",
    "tvosplistinject": "",
    "version": "1.0.3"
}