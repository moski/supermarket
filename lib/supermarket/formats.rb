#require File.dirname(__FILE__) + "/jars/protobuf-format-java-1.2-SNAPSHOT.jar"
require File.dirname(__FILE__) + "/jars/protobuf-java-format-1.2.jar"


#Serialize protobuf to different formats using
#http://code.google.com/p/protobuf-java-format/
module Supermarket
  module Formats

    def to_json(*a)
      Java::ComGooglecodeProtobufFormat::JsonFormat.printToString(self)
    end

    def to_xml
      Java::ComGooglecodeProtobufFormat::XmlFormat.printToString(self)
    end

    def to_html
      Java::ComGooglecodeProtobufFormat::HtmlFormat.printToString(self)
    end

    def to_ruby
      require 'json'
      JSON.parse(to_json)
    end
  end
end

#make formats available everywhere
Java::ComGoogleProtobuf::GeneratedMessage.send(:include, Supermarket::Formats)
