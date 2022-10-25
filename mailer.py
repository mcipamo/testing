# to open/create a new html file in the write mode
f = open('/opt/rh/httpd24/root/usr/share/httpd/noindex/index.html', 'w')

# the html code which will go in the file index.html
html_template = """<html>
<head>
<title>Title</title>
</head>
<body>
<h2>Archivo modificado con la insecion del script python</h2>

<p>Default code has been loaded into the Editor.</p>

</body>
</html>
"""

# writing the code into the file
f.write(html_template)

# close the file
f.close()
