# embed_css

*Takes the `src` param value, grabs the style content associated within the source file, and injects the styles within a `style` tag on the page.*

### **Usage**

    {% embed_css src:public_path_to_your_css_file %}

### Parameters

- `src` string. required. The path to the CSS file you want to embed.

### Return

- The CSS code to be embedded.

## **Example**

### Input

    ...
    <body>
    ...
    {% embed_css src:/assets/img/embed-styles.css %}
    ...
    </body>

### **Output**

    ...
    <body>
    ...
    <style>
    body {
      margin: 0;
      padding: 0;
    }
    </style>
    ...
    </body>
