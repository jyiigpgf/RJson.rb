RJson.rb
========

为json格式，提供扩展的脚本。

rjson源文件:
<pre><code>
#def区

def welcome_image_url
	http://xxx.png
end

def welcome_image
{
	"type": "image",
    "dataBinding": {
        "url": "#{welcome_image_url}"
    }
}
end

def hello_world_str
	hello_world
end

#json区
{
	"type": "container",
	"styleBinding": {
	    "layout": "linearLayout",
	    "orientation": "horizontal"
    },
    "subViews" : [
		welcome_image
		,
		{
			"type": "label",
			"dataBinding": {
				"value": "#{hello_world_str}"
			}
		}
    ]
}
</code></pre>

转换后输出文件:
<pre><code>
{
  "type": "container",
  "styleBinding": {
    "layout": "linearLayout",
    "orientation": "horizontal"
  },
  "subViews": [
    {
      "type": "image",
      "dataBinding": {
        "url": "http://xxx.png"
      }
    },
    {
      "type": "label",
      "dataBinding": {
        "value": "hello_world"
      }
    }
  ]
}
</code></pre>
