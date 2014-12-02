RJson.rb
========

为json格式，提供扩展的脚本。

工作流程:
>    1. 替换json文本的block
>    2. 替换json文本的#{xxx}

使用方式: 
>    ruby json_conv.rb source.rjson dest.josn

source.rjson:
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

dest.json:
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
