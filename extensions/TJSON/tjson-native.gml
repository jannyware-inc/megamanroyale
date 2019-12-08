#define tj_init_gml
// TJSON Copyright (c) YellowAfterlife, 2016+
// Generated at 2019-03-25 08:13:09 (459ms) for v1.4.1804+
// tj_decode:
globalvar g_tj_decode_source;
globalvar g_tj_decode_offset;
globalvar g_tj_decode_length;
globalvar g_tj_decode_esc; g_tj_decode_esc = 92;
globalvar g_tj_decode_string_buf; g_tj_decode_string_buf = buffer_create(1024, 1, 1);
globalvar g_tj_decode_list_pool; g_tj_decode_list_pool = ds_list_create();
// tj_encode:
globalvar g_tj_encode_encode_buffer; g_tj_encode_encode_buffer = buffer_create(1024, 1, 1);
// tj:
globalvar g_tj_decode_source;
globalvar g_tj_decode_offset;
globalvar g_tj_decode_length;
globalvar g_tj_error_text;
// tj.object:
globalvar g_tj_object_lookups; g_tj_object_lookups = ds_map_create();
globalvar g_tj_object_signatures; g_tj_object_signatures = ds_map_create();
globalvar g_tj_object_empty_lookup; g_tj_object_empty_lookup = tj_object_empty_lookup_init();
// tj:
globalvar g_tj_allow_value_keys; g_tj_allow_value_keys = false;
globalvar g_tj_allow_ident_keys; g_tj_allow_ident_keys = false;
// tj.source:
globalvar g_tj_source_length;
globalvar g_tj_source_sub_buf; g_tj_source_sub_buf = buffer_create(256, 0, 1);
// tj:
globalvar g_tj_true; g_tj_true = tj_magic_value("tj_true");
globalvar g_tj_false; g_tj_false = tj_magic_value("tj_false");
globalvar g_tj_error; g_tj_error = tj_magic_value("tj_error");
globalvar g_tj_null; g_tj_null = undefined;
globalvar g_tj_object_buf; g_tj_object_buf = buffer_create(1024, 1, 1);
//{ tj.stringbuf

#define tj_stringbuf_add_sub
/// @description  tj_stringbuf_add_sub(this:buffer, s:TjSource, pos:int, len:int)
/// @param this:buffer
/// @param  s:TjSource
/// @param  pos:int
/// @param  len:int
var this1 = argument[0], s = argument[1], pos = argument[2], len = argument[3];
var p = buffer_tell(this1);
var l = buffer_get_size(this1);
var f = pos + len;
while (l < f) {
	l *= 2;
	buffer_resize(this1, l);
}
buffer_copy(s, pos, len, this1, p);
buffer_seek(this1, 1, len);

#define tj_stringbuf_add_key
/// @description  tj_stringbuf_add_key(this:buffer, key:TjValue)
/// @param this:buffer
/// @param  key:TjValue
var this1 = argument[0], key = argument[1];
if (is_string(key)) {
	buffer_write(this1, 13, key);
} else if (g_tj_allow_value_keys) {
	if (is_real(key)) {
		buffer_write(this1, 1, 146);
		tj_encode_number(this1, key);
	} else if (key == g_tj_true) {
		buffer_write(this1, 3, 12689);
	} else if (key == g_tj_false) {
		buffer_write(this1, 3, 12433);
	} else if (key == undefined) {
		buffer_write(this1, 3, 32657);
	} else show_error("Key can only be string/number/bool/undefined.", false);
} else show_error("Key can only be string.", false);
buffer_write(this1, 1, 27);

#define tj_stringbuf_to_string
/// @description  tj_stringbuf_to_string(this:buffer)->string
/// @param this:buffer
var this1 = argument[0];
buffer_write(this1, 1, 0);
buffer_seek(this1, 0, 0);
return buffer_read(this1, 11);
//}
//{ tj_decode

#define tj_decode_uxchar
/// @description  tj_decode_uxchar(pos:int)->TjValue
/// @param pos:int
var pos = argument[0];
g_tj_error_text = ("Unexpected character " + string(buffer_peek(g_tj_decode_source, pos - 1, 1))) + " at position " + string(pos) + ".";
return g_tj_error;

#define tj_decode_string
/// @description  tj_decode_string()->TjValue
var src = g_tj_decode_source;
var ofs = g_tj_decode_offset;
var len = g_tj_decode_length;
var start = ofs;
var sub;
var buf = g_tj_decode_string_buf;
buffer_seek(buf, 0, 0);
while (ofs < len) {
	var c = buffer_peek(src, ofs++, 1);
	if (c == 34) {
		g_tj_decode_offset = ofs;
		tj_stringbuf_add_sub(buf, src, start, ofs - start - 1);
		return tj_stringbuf_to_string(buf);
	} else if (c == 92) {
		tj_stringbuf_add_sub(buf, src, start, ofs - start - 1);
		c = buffer_peek(src, ofs++, 1);
		switch (c) {
			case 114: buffer_write(buf, 1, 13); break;
			case 110: buffer_write(buf, 1, 10); break;
			case 116: buffer_write(buf, 1, 9); break;
			case 98: buffer_write(buf, 1, 8); break;
			case 102: buffer_write(buf, 1, 12); break;
			case 34: case 47: case 92: buffer_write(buf, 1, c); break;
			case 117:
				var uc = 0;
				repeat (4) {
					c = buffer_peek(src, ofs++, 1);
					if (c >= 48 && c <= 57) {
						c -= 48;
					} else if (c >= 65 && c <= 70) {
						c -= 55;
					} else if (c >= 97 && c <= 102) {
						c -= 87;
					} else c = 0;
					uc = ((uc << 4) | c);
				}
				if (uc <= 127) {
					buffer_write(buf, 1, uc);
				} else if (uc <= 2047) {
					buffer_write(buf, 1, (192 | (uc >> 6)));
					buffer_write(buf, 1, (128 | (uc & 63)));
				} else if (uc <= 65535) {
					buffer_write(buf, 1, (224 | (uc >> 12)));
					buffer_write(buf, 1, (128 | ((uc >> 6) & 63)));
					buffer_write(buf, 1, (128 | (uc & 63)));
				} else {
					buffer_write(buf, 1, (240 | (uc >> 18)));
					buffer_write(buf, 1, (128 | ((uc >> 12) & 63)));
					buffer_write(buf, 1, (128 | ((uc >> 6) & 63)));
					buffer_write(buf, 1, (128 | (uc & 63)));
				}
				break;
			default:
				g_tj_error_text = "Invalid escape sequence at position " + string(ofs - 1) + ".";
				return g_tj_error;
		}
		start = ofs;
	}
}
g_tj_error_text = "Unclosed string at position " + string(g_tj_decode_offset - 1) + ".";
return g_tj_error;

#define tj_decode_number
/// @description  tj_decode_number(c:int)->TjValue
/// @param c:int
var c = argument[0];
var src = g_tj_decode_source;
var ofs = g_tj_decode_offset;
var len = g_tj_decode_length;
var start = ofs - 1;
var neg = c == 45;
var dig = !neg;
var zero = c == 48;
var dot = false;
var epo = -1;
var eso = -1;
var sub;
while (ofs < len) {
	c = buffer_peek(src, ofs++, 1);
	switch (c) {
		case 48:
			if (zero && !dot) {
				g_tj_error_text = "Invalid number at position " + string(start) + ".";
				return g_tj_error;
			}
			if (neg) {
				neg = false;
				zero = true;
			}
			dig = true;
			break;
		case 46:
			if (neg || dot) {
				g_tj_error_text = "Invalid number at position " + string(start) + ".";
				return g_tj_error;
			}
			dig = false;
			dot = true;
			break;
		case 69: case 101:
			if (neg || epo >= 0) {
				g_tj_error_text = "Invalid number at position " + string(start) + ".";
				return g_tj_error;
			}
			dig = false;
			epo = ofs;
			break;
		case 43: case 45:
			if (epo < 0 || eso >= 0) {
				g_tj_error_text = "Invalid number at position " + string(start) + ".";
				return g_tj_error;
			}
			dig = false;
			eso = ofs;
			break;
		default:
			if (c >= 49 && c <= 57) {
				if (zero && !dot) {
					g_tj_error_text = "Invalid number at position " + string(start) + ".";
					return g_tj_error;
				}
				dig = true;
				zero = false;
				neg = false;
			} else {
				if (!dig) {
					g_tj_error_text = "Invalid number at position " + string(start) + ".";
					return g_tj_error;
				}
				--ofs;
				if (epo == ofs || eso == ofs) {
					g_tj_error_text = "Invalid number at position " + string(start) + ".";
					return g_tj_error;
				} else {
					g_tj_decode_offset = ofs;
					sub = tj_source_sub(src, start, ofs - start);
					return real(sub);
				}
			}
	}
}
if (epo == ofs || eso == ofs) {
	g_tj_error_text = "Invalid number at position " + string(start) + ".";
	return g_tj_error;
} else {
	g_tj_decode_offset = ofs;
	sub = tj_source_sub(src, start, ofs - start);
	return real(sub);
}

#define tj_decode_value
/// @description  tj_decode_value()->TjValue
var src = g_tj_decode_source;
var ofs = g_tj_decode_offset;
var len = g_tj_decode_length;
var start, sep, sub, num, key, val, out, i, n, keys, vals, _depool_i, _depool_r;
while (ofs < len) {
	var c = buffer_peek(src, ofs++, 1);
	switch (c) {
		case 9: case 10: case 13: case 32: break;
		case 123:
			start = ofs;
			_depool_i = ds_list_size(g_tj_decode_list_pool) - 1;
			if (_depool_i >= 0) {
				_depool_r = g_tj_decode_list_pool[|_depool_i];
				ds_list_delete(g_tj_decode_list_pool, _depool_i);
				keys = _depool_r;
			} else keys = ds_list_create();
			_depool_i = ds_list_size(g_tj_decode_list_pool) - 1;
			if (_depool_i >= 0) {
				_depool_r = g_tj_decode_list_pool[|_depool_i];
				ds_list_delete(g_tj_decode_list_pool, _depool_i);
				vals = _depool_r;
			} else vals = ds_list_create();
			sep = true;
			while (ofs < len) {
				c = buffer_peek(src, ofs++, 1);
				switch (c) {
					case 9: case 10: case 13: case 32: break;
					case 125:
						g_tj_decode_offset = ofs;
						n = ds_list_size(vals);
						out = undefined;
						if (n > 0) {
							out[2, 0] = undefined;
							i = n - 1;
							out[1, i] = 0;
							out[0, i] = 0;
							var sb = g_tj_object_buf;
							buffer_seek(sb, 0, 0);
							for (i = 0; i < n; ++i) {
								key = keys[|i];
								out[1, i] = key;
								out[0, i] = vals[|i];
								tj_stringbuf_add_key(sb, key);
							}
							sub = tj_stringbuf_to_string(sb);
							var lookup = g_tj_object_lookups[?sub];
							if (lookup == undefined) {
								lookup = ds_map_create();
								for (i = 0; i < n; ++i) {
									lookup[?keys[|i]] = i;
								}
								g_tj_object_lookups[?sub] = lookup;
								g_tj_object_signatures[?lookup] = sub;
							}
							out[2, 0] = lookup;
						} else out[2, 0] = g_tj_object_empty_lookup;
						_depool_r = keys;
						ds_list_clear(_depool_r);
						ds_list_add(g_tj_decode_list_pool, _depool_r);
						_depool_r = vals;
						ds_list_clear(_depool_r);
						ds_list_add(g_tj_decode_list_pool, _depool_r);
						return out;
					case 44:
						if (sep) {
							_depool_r = keys;
							ds_list_clear(_depool_r);
							ds_list_add(g_tj_decode_list_pool, _depool_r);
							_depool_r = vals;
							ds_list_clear(_depool_r);
							ds_list_add(g_tj_decode_list_pool, _depool_r);
							return tj_decode_uxchar(ofs);
						} else sep = true;
						break;
					default:
						if (c != 34 && !(g_tj_allow_value_keys || g_tj_allow_ident_keys) || !sep) {
							_depool_r = keys;
							ds_list_clear(_depool_r);
							ds_list_add(g_tj_decode_list_pool, _depool_r);
							_depool_r = vals;
							ds_list_clear(_depool_r);
							ds_list_add(g_tj_decode_list_pool, _depool_r);
							return tj_decode_uxchar(ofs);
						}
						if (c != 34) {
							g_tj_decode_offset = ofs - 1;
							if (g_tj_allow_ident_keys && (c == 95 || c >= 97 && c <= 122 || c >= 65 && c <= 90)) {
								while (ofs < len) {
									c = buffer_peek(src, ofs, 1);
									if (c == 95 || c >= 97 && c <= 122 || c >= 65 && c <= 90) ++ofs; else break;
								}
								key = tj_source_sub(src, g_tj_decode_offset, ofs - g_tj_decode_offset);
								if (g_tj_allow_value_keys) switch (key) {
									case "true": key = g_tj_true; break;
									case "false": key = g_tj_false; break;
									case "null": key = undefined; break;
								}
								g_tj_decode_offset = ofs;
							} else if (g_tj_allow_value_keys) {
								key = tj_decode_value();
							} else {
								_depool_r = keys;
								ds_list_clear(_depool_r);
								ds_list_add(g_tj_decode_list_pool, _depool_r);
								_depool_r = vals;
								ds_list_clear(_depool_r);
								ds_list_add(g_tj_decode_list_pool, _depool_r);
								return tj_decode_uxchar(ofs);
							}
						} else {
							g_tj_decode_offset = ofs;
							key = tj_decode_string();
						}
						if (key == g_tj_error) {
							_depool_r = keys;
							ds_list_clear(_depool_r);
							ds_list_add(g_tj_decode_list_pool, _depool_r);
							_depool_r = vals;
							ds_list_clear(_depool_r);
							ds_list_add(g_tj_decode_list_pool, _depool_r);
							return key;
						}
						ofs = g_tj_decode_offset;
						while (ofs < len) {
							c = buffer_peek(src, ofs++, 1);
							switch (c) {
								case 9: case 10: case 13: case 32: continue;
							}
							if (c != 58) {
								_depool_r = keys;
								ds_list_clear(_depool_r);
								ds_list_add(g_tj_decode_list_pool, _depool_r);
								_depool_r = vals;
								ds_list_clear(_depool_r);
								ds_list_add(g_tj_decode_list_pool, _depool_r);
								return tj_decode_uxchar(ofs);
							} else break;
						}
						g_tj_decode_offset = ofs;
						val = tj_decode_value();
						if (val == g_tj_error) {
							_depool_r = keys;
							ds_list_clear(_depool_r);
							ds_list_add(g_tj_decode_list_pool, _depool_r);
							_depool_r = vals;
							ds_list_clear(_depool_r);
							ds_list_add(g_tj_decode_list_pool, _depool_r);
							return val;
						}
						ofs = g_tj_decode_offset;
						ds_list_add(keys, key);
						ds_list_add(vals, val);
						sep = false;
				}
			}
			_depool_r = keys;
			ds_list_clear(_depool_r);
			ds_list_add(g_tj_decode_list_pool, _depool_r);
			_depool_r = vals;
			ds_list_clear(_depool_r);
			ds_list_add(g_tj_decode_list_pool, _depool_r);
			g_tj_error_text = "Unclosed curly bracket at position " + string(start) + ".";
			return g_tj_error;
		case 91:
			start = ofs;
			_depool_i = ds_list_size(g_tj_decode_list_pool) - 1;
			if (_depool_i >= 0) {
				_depool_r = g_tj_decode_list_pool[|_depool_i];
				ds_list_delete(g_tj_decode_list_pool, _depool_i);
				vals = _depool_r;
			} else vals = ds_list_create();
			sep = true;
			while (ofs < len) {
				c = buffer_peek(src, ofs++, 1);
				switch (c) {
					case 9: case 10: case 13: case 32: break;
					case 44:
						if (sep) {
							_depool_r = vals;
							ds_list_clear(_depool_r);
							ds_list_add(g_tj_decode_list_pool, _depool_r);
							return tj_decode_uxchar(ofs);
						} else sep = true;
						break;
					case 93:
						g_tj_decode_offset = ofs;
						n = ds_list_size(vals);
						out = undefined;
						out = array_create(n, 0);
						for (i = 0; i < n; ++i) {
							out[@i] = vals[|i];
						}
						_depool_r = vals;
						ds_list_clear(_depool_r);
						ds_list_add(g_tj_decode_list_pool, _depool_r);
						return out;
					default:
						if (sep) {
							g_tj_decode_offset = ofs - 1;
							val = tj_decode_value();
							if (val == g_tj_error) {
								_depool_r = vals;
								ds_list_clear(_depool_r);
								ds_list_add(g_tj_decode_list_pool, _depool_r);
								return val;
							}
							ds_list_add(vals, val);
							ofs = g_tj_decode_offset;
							sep = false;
						} else {
							_depool_r = vals;
							ds_list_clear(_depool_r);
							ds_list_add(g_tj_decode_list_pool, _depool_r);
							return tj_decode_uxchar(ofs);
						}
				}
			}
			_depool_r = vals;
			ds_list_clear(_depool_r);
			ds_list_add(g_tj_decode_list_pool, _depool_r);
			g_tj_error_text = "Unclosed square bracket at position " + string(start) + ".";
			return g_tj_error;
		case 34:
			g_tj_decode_offset = ofs;
			val = tj_decode_string();
			if (val == g_tj_error) return val;
			return val;
		case 45:
			g_tj_decode_offset = ofs;
			num = tj_decode_number(45);
			return num;
		case 116:
			start = ofs;
			if (buffer_peek(src, ofs++, 1) != 114) return tj_decode_uxchar(start);
			if (buffer_peek(src, ofs++, 1) != 117) return tj_decode_uxchar(start);
			if (buffer_peek(src, ofs++, 1) != 101) return tj_decode_uxchar(start);
			g_tj_decode_offset = ofs;
			return g_tj_true;
		case 102:
			start = ofs;
			if (buffer_peek(src, ofs++, 1) != 97) return tj_decode_uxchar(start);
			if (buffer_peek(src, ofs++, 1) != 108) return tj_decode_uxchar(start);
			if (buffer_peek(src, ofs++, 1) != 115) return tj_decode_uxchar(start);
			if (buffer_peek(src, ofs++, 1) != 101) return tj_decode_uxchar(start);
			g_tj_decode_offset = ofs;
			return g_tj_false;
		case 110:
			start = ofs;
			if (buffer_peek(src, ofs++, 1) != 117) return tj_decode_uxchar(start);
			if (buffer_peek(src, ofs++, 1) != 108) return tj_decode_uxchar(start);
			if (buffer_peek(src, ofs++, 1) != 108) return tj_decode_uxchar(start);
			g_tj_decode_offset = ofs;
			return undefined;
		default:
			if (c >= 48 && c <= 57) {
				g_tj_decode_offset = ofs;
				num = tj_decode_number(c);
				return num;
			} else return tj_decode_uxchar(ofs);
	}
}
g_tj_error_text = "Unexpected end of input at position " + string(ofs) + ".";
return g_tj_error;

#define tj_decode_main
/// @description  tj_decode_main(json:string)->TjValue
/// @param json:string
var json = argument[0];
var src = tj_source__new(json);
g_tj_decode_source = src;
g_tj_decode_offset = 0;
g_tj_decode_length = buffer_get_size(src) - 1;
g_tj_error_text = "";
var val = tj_decode_value();
if (g_tj_error_text == "") {
	var ofs = g_tj_decode_offset;
	var len = g_tj_decode_length;
	while (ofs < len) {
		switch (buffer_peek(src, ofs++, 1)) {
			case 9: case 10: case 13: case 32: continue;
		}
		g_tj_error_text = "Unexpected trailing data at position " + string(ofs) + ".";
		val = g_tj_error;
		break;
	}
} else val = g_tj_error;
buffer_delete(g_tj_decode_source);
return val;
//}
//{ tj_encode

#define tj_encode_string
/// @description  tj_encode_string(buf:buffer, s:string)
/// @param buf:buffer
/// @param  s:string
var buf = argument[0], s = argument[1];
buffer_write(buf, 1, 34);
var n = string_length(s);
for (var i = 1; i <= n; ++i) {
	var uc = string_ord_at(s, i);
	switch (uc) {
		case 34:
			buffer_write(buf, 1, 92);
			buffer_write(buf, 1, 34);
			break;
		case 92:
			buffer_write(buf, 1, 92);
			buffer_write(buf, 1, 92);
			break;
		case 9:
			buffer_write(buf, 1, 92);
			buffer_write(buf, 1, 116);
			break;
		case 13:
			buffer_write(buf, 1, 92);
			buffer_write(buf, 1, 114);
			break;
		case 10:
			buffer_write(buf, 1, 92);
			buffer_write(buf, 1, 110);
			break;
		case 8:
			buffer_write(buf, 1, 92);
			buffer_write(buf, 1, 98);
			break;
		case 12:
			buffer_write(buf, 1, 92);
			buffer_write(buf, 1, 102);
			break;
		default:
			if (uc <= 127) {
				buffer_write(buf, 1, uc);
			} else if (uc <= 2047) {
				buffer_write(buf, 1, (192 | (uc >> 6)));
				buffer_write(buf, 1, (128 | (uc & 63)));
			} else if (uc <= 65535) {
				buffer_write(buf, 1, (224 | (uc >> 12)));
				buffer_write(buf, 1, (128 | ((uc >> 6) & 63)));
				buffer_write(buf, 1, (128 | (uc & 63)));
			} else {
				buffer_write(buf, 1, (240 | (uc >> 18)));
				buffer_write(buf, 1, (128 | ((uc >> 12) & 63)));
				buffer_write(buf, 1, (128 | ((uc >> 6) & 63)));
				buffer_write(buf, 1, (128 | (uc & 63)));
			}
	}
}
buffer_write(buf, 1, 34);

#define tj_encode_number
/// @description  tj_encode_number(buf:buffer, v:real)
/// @param buf:buffer
/// @param  v:real
var buf = argument[0], v = argument[1];
var s = string_format(v, 0, 15);
var n = string_pos(".", s);
if (n > 0) {
	for (var i = string_length(s); i > n; --i) {
		if (string_byte_at(s, i) != 48) {
			buffer_write(buf, 13, string_copy(s, 1, i));
			break;
		}
	}
	if (i <= n) buffer_write(buf, 13, string_copy(s, 1, n - 1));
} else buffer_write(buf, 13, s);

#define tj_encode_value
/// @description  tj_encode_value(buf:buffer, val:TjValue, indent:string, tab:int)
/// @param buf:buffer
/// @param  val:TjValue
/// @param  indent:string
/// @param  tab:int
var buf = argument[0], val = argument[1], indent = argument[2], tab = argument[3];
var s, i, n, t;
if (is_string(val)) {
	tj_encode_string(buf, val);
} else if (val == g_tj_true) {
	buffer_write(buf, 13, "true");
} else if (val == g_tj_false) {
	buffer_write(buf, 13, "false");
} else if (is_array(val)) {
	if (array_length_2d(val, 2) == 1) {
		buffer_write(buf, 1, 123);
		++tab;
		n = ds_map_size(val[2, 0]);
		for (i = 0; i < n; ++i) {
			if (i > 0) buffer_write(buf, 1, 44);
			if (indent != undefined) {
				if (indent != "") {
					buffer_write(buf, 1, 10);
					t = tab;
					while (--t >= 0) {
						buffer_write(buf, 13, indent);
					}
				} else buffer_write(buf, 1, 32);
			}
			if (g_tj_allow_value_keys) tj_encode_value(buf, val[1, i], indent, tab); else tj_encode_string(buf, string(val[1, i]));
			buffer_write(buf, 1, 58);
			if (indent != undefined) buffer_write(buf, 1, 32);
			tj_encode_value(buf, val[0, i], indent, tab);
		}
		--tab;
		if (indent != undefined) {
			if (indent != "" && n > 0) {
				buffer_write(buf, 1, 10);
				t = tab;
				while (--t >= 0) {
					buffer_write(buf, 13, indent);
				}
			} else buffer_write(buf, 1, 32);
		}
		buffer_write(buf, 1, 125);
	} else {
		var q = val;
		if (is_array(q) && array_height_2d(q) <= 1) {
			buffer_write(buf, 1, 91);
			++tab;
			n = array_length_1d(val);
			for (i = 0; i < n; ++i) {
				if (i > 0) buffer_write(buf, 1, 44);
				if (indent != undefined) {
					if (indent != "") {
						buffer_write(buf, 1, 10);
						t = tab;
						while (--t >= 0) {
							buffer_write(buf, 13, indent);
						}
					} else buffer_write(buf, 1, 32);
				}
				tj_encode_value(buf, val[i], indent, tab);
			}
			--tab;
			if (indent != undefined) {
				if (indent != "" && n > 0) {
					buffer_write(buf, 1, 10);
					t = tab;
					while (--t >= 0) {
						buffer_write(buf, 13, indent);
					}
				} else buffer_write(buf, 1, 32);
			}
			buffer_write(buf, 1, 93);
		} else buffer_write(buf, 13, "null");
	}
} else if (val == undefined) {
	buffer_write(buf, 13, "null");
} else {
	var num = real(val);
	if (num == val) tj_encode_number(buf, num); else buffer_write(buf, 13, "null");
}

#define tj_encode_main
/// @description  tj_encode_main(val:TjValue, indent:string)->string
/// @param val:TjValue
/// @param  indent:string
var val = argument[0], indent = argument[1];
var buf = g_tj_encode_encode_buffer;
buffer_seek(buf, 0, 0);
tj_encode_value(buf, val, indent, 0);
buffer_write(buf, 1, 0);
buffer_seek(buf, 0, 0);
return buffer_read(buf, 11);
//}
//{ tj

#define tj_decode
/// @description  tj_decode(json:string)->TjValue
/// @param json:string
var json = argument[0];
var src = tj_source__new(json);
g_tj_decode_source = src;
g_tj_decode_offset = 0;
g_tj_decode_length = buffer_get_size(src) - 1;
g_tj_error_text = "";
var val = tj_decode_value();
if (g_tj_error_text == "") {
	var ofs = g_tj_decode_offset;
	var len = g_tj_decode_length;
	while (ofs < len) {
		switch (buffer_peek(src, ofs++, 1)) {
			case 9: case 10: case 13: case 32: continue;
		}
		g_tj_error_text = "Unexpected trailing data at position " + string(ofs) + ".";
		val = g_tj_error;
		break;
	}
} else val = g_tj_error;
buffer_delete(g_tj_decode_source);
return val;

#define tj_encode
/// @description  tj_encode(value:TjValue, ?indent:string)->string
/// @param value:TjValue
/// @param  ?indent:string
var value = argument[0], indent;
if (argument_count > 1) indent = argument[1]; else indent = undefined;
var buf = g_tj_encode_encode_buffer;
buffer_seek(buf, 0, 0);
tj_encode_value(buf, value, indent, 0);
buffer_write(buf, 1, 0);
buffer_seek(buf, 0, 0);
return buffer_read(buf, 11);
//}
//{ tj.object

#define tj_object_empty_lookup_init
/// @description  tj_object_empty_lookup_init()->Map<string; int>
var o = ds_map_create();
g_tj_object_lookups[?""] = o;
g_tj_object_signatures[?o] = "";
return o;
//}
//{ tj

#define tj_opt_value_keys
/// @description  tj_opt_value_keys(?allow:bool)->bool
/// @param ?allow:bool
var allow;
if (argument_count > 0) allow = argument[0]; else allow = undefined;
if (allow != undefined) {
	g_tj_allow_value_keys = allow;
	return allow;
} else return g_tj_allow_value_keys;

#define tj_opt_ident_keys
/// @description  tj_opt_ident_keys(?allow:bool)->bool
/// @param ?allow:bool
var allow;
if (argument_count > 0) allow = argument[0]; else allow = undefined;
if (allow != undefined) {
	g_tj_allow_ident_keys = allow;
	return allow;
} else return g_tj_allow_ident_keys;
//}
//{ tj.source

#define tj_source__new
/// @description  tj_source__new(s:string)->TjSource
/// @param s:string
var s = argument[0];
var n = string_byte_length(s);
var this1 = buffer_create(n + 1, 1, 1);
var sb = g_tj_source_sub_buf;
if (buffer_get_size(sb) < n) buffer_resize(g_tj_source_sub_buf, n);
buffer_poke(sb, 0, 13, s);
buffer_copy(sb, 0, n, this1, 0);
return this1;

#define tj_source_sub
/// @description  tj_source_sub(this:buffer, pos:int, len:int)->string
/// @param this:buffer
/// @param  pos:int
/// @param  len:int
var this1 = argument[0], pos = argument[1], len = argument[2];
var b = g_tj_source_sub_buf;
if (buffer_get_size(b) < len + 1) buffer_resize(b, len + 1);
buffer_copy(this1, pos, len, b, 0);
buffer_poke(b, len, 1, 0);
buffer_seek(b, 0, 0);
return buffer_read(b, 11);
//}
//{ tj

#define tj_is_array
/// @description  tj_is_array(q:dynamic)->bool
/// @param q:dynamic
var q = argument[0];
return is_array(q) && array_height_2d(q) <= 1;

#define tj_is_object
/// @description  tj_is_object(q:dynamic)->bool
/// @param q:dynamic
var q = argument[0];
return array_length_2d(q, 2) == 1;

#define tj_magic_value
/// @description  tj_magic_value(v:TjValue)->TjValue
/// @param v:TjValue
var v = argument[0];
var r = undefined;
r[3, 0] = v;
return r;

#define tj_bool
/// @description  tj_bool(v:bool)->TjValue
/// @param v:bool
var v = argument[0];
if (v) return g_tj_true; else return g_tj_false;

#define tj_is_bool
/// @description  tj_is_bool(v:TjValue)->bool
/// @param v:TjValue
var v = argument[0];
if (v != g_tj_true) return v == g_tj_false; else return true;

#define tj_typeof
/// @description  tj_typeof(q:TjValue)->string
/// @param q:TjValue
var q = argument[0];
var q1 = q;
var r;
if (array_length_2d(q1, 2) == 1) {
	r = "object";
} else if (is_array(q1) && array_height_2d(q1) <= 1) {
	r = "array";
} else if (q1 == g_tj_false || q1 == g_tj_true) {
	r = "boolean";
} else if (is_string(q1)) {
	r = "string";
} else if (q1 == g_tj_error) {
	r = "error";
} else if (q1 == undefined) {
	r = "undefined";
} else if (real(q1) == q1) {
	r = "number";
} else r = "unknown";
return r;

#define tj_typeid
/// @description  tj_typeid(q:TjValue)->string
/// @param q:TjValue
var q = argument[0];
var q1 = q;
var r;
if (array_length_2d(q1, 2) == 1) {
	r = tj_type_object;
} else if (is_array(q1) && array_height_2d(q1) <= 1) {
	r = tj_type_array;
} else if (q1 == g_tj_false || q1 == g_tj_true) {
	r = tj_type_boolean;
} else if (is_string(q1)) {
	r = tj_type_string;
} else if (q1 == g_tj_error) {
	r = tj_type_error;
} else if (q1 == undefined) {
	r = tj_type_undefined;
} else if (real(q1) == q1) {
	r = tj_type_number;
} else r = tj_type_unknown;
return r;

#define tj_object
/// @description  tj_object(...key_value_pairs:TjValue)->TjValue
/// @param ...key_value_pairs:TjValue
var n = (argument_count >> 1);
var q = undefined;
if (n == 0) {
	q[2, 0] = g_tj_object_empty_lookup;
	return q;
}
q[2, 0] = undefined;
var i = n - 1;
q[1, i] = 0;
q[0, i] = 0;
var b = g_tj_object_buf;
buffer_seek(b, 0, 0);
for (i = 0; i < n; ++i) {
	var key = argument[(i << 1)];
	q[1, i] = key;
	q[0, i] = argument[(i << 1) + 1];
	tj_stringbuf_add_key(b, key);
}
var sig = tj_stringbuf_to_string(b);
var lookup = g_tj_object_lookups[?sig];
if (lookup == undefined) {
	lookup = ds_map_create();
	for (i = 0; i < n; ++i) {
		lookup[?argument[(i << 1)]] = i;
	}
	g_tj_object_lookups[?sig] = lookup;
	g_tj_object_signatures[?lookup] = sig;
}
q[2, 0] = lookup;
return q;

#define tj_array
/// @description  tj_array(...values:TjValue)->array<TjValue>
/// @param ...values:TjValue
var i = argument_count;
var r1 = undefined;
r1 = array_create(i, 0);
while (--i >= 0) {
	r1[i] = argument[i];
}
return r1;

#define tj_get
/// @description  tj_get(q:TjValue, key:string)->TjValue
/// @param q:TjValue
/// @param  key:string
var q = argument[0], key = argument[1];
if (array_length_2d(q, 2) == 1) {
	var index = ds_map_find_value(q[2, 0], key);
	if (index != undefined) return q[0, index]; else return undefined;
} else show_error(string(q) + " is not an object.", false);

#define tj_set
/// @description  tj_set(q:TjValue, key:string, val:TjValue)
/// @param q:TjValue
/// @param  key:string
/// @param  val:TjValue
var q = argument[0], key = argument[1], val = argument[2];
if (array_length_2d(q, 2) == 1) {
	var lookup = q[2, 0];
	var index = lookup[?key];
	if (index == undefined) {
		index = ds_map_size(lookup);
		q[@1, index] = key;
		var b = g_tj_object_buf;
		buffer_seek(b, 0, 0);
		buffer_write(b, 13, g_tj_object_signatures[?lookup]);
		tj_stringbuf_add_key(b, key);
		var sig = tj_stringbuf_to_string(b);
		var next = g_tj_object_lookups[?sig];
		if (next == undefined) {
			next = ds_map_create();
			ds_map_copy(next, lookup);
			next[?key] = index;
			g_tj_object_lookups[?sig] = next;
			g_tj_object_signatures[?next] = sig;
		}
		q[@2, 0] = next;
	}
	q[@0, index] = val;
} else show_error(string(q) + " is not an object.", false);

#define tj_delete
/// @description  tj_delete(q:TjValue, key:string)
/// @param q:TjValue
/// @param  key:string
var q = argument[0], key = argument[1];
if (array_length_2d(q, 2) == 1) {
	var lookup = q[2, 0];
	var index = lookup[?key];
	if (index != undefined) {
		var size = ds_map_size(lookup);
		var b = g_tj_object_buf;
		buffer_seek(b, 0, 0);
		tj_stringbuf_add_key(b, key);
		var sig = tj_stringbuf_to_string(b);
		sig = string_replace(g_tj_object_signatures[?lookup], sig, "");
		var next = g_tj_object_lookups[?sig];
		if (next == undefined) {
			next = ds_map_create();
			ds_map_copy(next, lookup);
			ds_map_delete(next, key);
			var i = index + 1;
			for (var _g1 = size; i < _g1; i++) {
				next[?q[1, i]] = i - 1;
			}
			g_tj_object_lookups[?sig] = next;
			g_tj_object_signatures[?next] = sig;
		}
		q[@2, 0] = next;
		for (--size; index < size; ++index) {
			q[@1, index] = q[1, index + 1];
			q[@0, index] = q[0, index + 1];
		}
		q[@1, size] = g_tj_error;
		q[@0, size] = g_tj_error;
	}
} else show_error(string(q) + " is not an object.", false);

#define tj_size
/// @description  tj_size(q:TjValue)->int
/// @param q:TjValue
var q = argument[0];
if (array_length_2d(q, 2) == 1) return ds_map_size(q[2, 0]); else return 0;

#define tj_keys
/// @description  tj_keys(q:TjValue)->array<string>
/// @param q:TjValue
var q = argument[0];
if (array_length_2d(q, 2) == 1) {
	var i = ds_map_size(q[2, 0]);
	var r1 = undefined;
	r1 = array_create(i, 0);
	while (--i >= 0) {
		r1[@i] = q[1, i];
	}
	return r1;
} else {
	var r2 = undefined;
	r2 = array_create(0, 0);
	return r2;
}

#define tj_compare
/// @description  tj_compare(a:TjValue, b:TjValue)->bool
/// @param a:TjValue
/// @param  b:TjValue
var a = argument[0], b = argument[1];
if (a == b) return true;
var i, n;
if (is_array(a)) {
	if (!is_array(b)) return false;
	if (array_length_2d(a, 2) == 1) {
		if (array_length_2d(b, 2) != 1) return false;
		var al = a[2, 0];
		if (al != b[2, 0]) return false;
		n = ds_map_size(al);
		i = 0;
		while (i < n) {
			if (tj_compare(a[i], b[i])) ++i; else return false;
		}
		return true;
	} else {
		if (array_height_2d(b) > 2) return false;
		n = array_length_1d(a);
		i = 0;
		while (i < n) {
			if (tj_compare(a[i], b[i])) ++i; else return false;
		}
		return true;
	}
}
return false;

#define tj_copy
/// @description  tj_copy(val:TjValue)->TjValue
/// @param val:TjValue
var val = argument[0];
var i, n, v;
if (is_array(val)) {
	if (array_length_2d(val, 2) == 1) {
		n = ds_map_size(val[2, 0]);
		val[2, 0] = val[2, 0];
		for (i = 0; i < n; ++i) {
			v = val[0, i];
			if (is_array(v)) val[@0, i] = tj_copy(v);
		}
	} else if (val == g_tj_true || val == g_tj_false || val == g_tj_error) {
		return val;
	} else {
		n = array_height_2d(val) - 1;
		if (n >= 0) {
			val[n, 0] = val[n, 0];
			while (n >= 0) {
				i = array_length_2d(val, n);
				while (--i >= 0) {
					v = val[n, i];
					if (is_array(v)) val[@n, i] = tj_copy(v);
				}
				--n;
			}
		} else {
			var r = undefined;
			r = array_create(0, 0);
			val = r;
		}
	}
}
return val;
//}

