print('''<HTML>
<HEAD>
  <TITLE>Example Web Page</TITLE>
</HEAD>
<body>
<p>You have reached this web page by typing %sexample.com%s,
%sexample.net%s,
  or %sexample.org%s into your web browser.</p>
<p>These domain names are reserved for use in documentation and are not availabl
e
  for registration. See <a href="http://www.rfc-editor.org/rfc/rfc2606.txt">RFC
  2606</a>, Section 3.</p>
</BODY>
</HTML>'''%(6*['%s']))%(6*('&quot;',))