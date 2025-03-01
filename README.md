# ntldd

This little utility does the one thing most people want from `ldd` - it gives you a list of libraries that a library or executable depends on.

Pros:
 * Free software;   
 * Knows about delayed library loading;  
 * Can check only local dependencies, ignoring system libraries;   
 * Can list dependencies recursively (like depends.exe does, but without duplicating entries);  
 * Output tries to mimic ldd (might be usable as a drop-in replacement for ldd).  

Cons:
 * Likely buggy and may fail spectacularly on unusual PE files (especially those created by toolsets other than MSVC or GCC);  
 * May not work on Windows CE or in relatively unusual environments;  
 * Does not have the advanced features of ldd (most options do not work);  
 * Does not fully mimic ldd.  
