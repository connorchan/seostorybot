load 'headline.rb'

class HeadlineGenerator
  #Arrays holding different parts of potential headlines
  $prefixes = ["3", "4", "5", "6", "7", "9", "This", "Study:", "Moz:", "Case Study:", "Breaking:", "Alert:", "Try it Now:", "Google:"]

  $questions = ["Should You Update Your", "What is", "When Should I Use", "How Is", "Have You Heard of",
    "What Should I Do About", "Have You Upgraded to", "What Has Caused the Rise of"]

  $adjectives = ["Amazing", "Innovative", "Great", "Nifty", "Inspiring", "Cool", "Helpful", "Mindblowing", "Proven"]

  $incentives = ["Want to Improve", "Ways to Improve", "This ONE SIMPLE Hack Will Reinvigorate",
    "2015 Guide to", "Get Higher", "Want to Rank Higher? Try", "Announcing the Death of", "Amazing Content For"]
  
  $bait = ["What To Expect With the Latest Panda Update for", "First Mobilepocalypse, Now", "Is Mobile the New",
    "Bing Announes Support for", "Google Ads? Try", "Have Your Rankings Plummeted? Time to Check Your",
    "DuckDuckGo is the New", "Upgrade to HTTPS or Risk Losing"]

  $buzzwords = ["Outreach", "Link Building", "Paid Search", "Google", "#SEO", "Optimization", "PPC", "Analytics",
    "#SEM", "Reporting", "CRO", "Marketing", "#Penguin", "#Panda", "Algorithm", "Search Marketing",
    "Digital Marketing", "Google Plus", "Google My Business", "Google Places", "App Indexing",
    "Sitemap", "#Schema", "Markup", "Quality Signal", "Ranking Signal", "Home Service Ads", "Search",
    "Content", "Content Marketing", "#AdWords API", "Analytics API", "Mobile", "Rich Media", "Rankings",
    "Conversion Tracking", "Tag Manager", "Negative Keywords", "CPC Bids", "Sitelinks", "Ad Extensions",
    "Long Tail Keywords", "Sub-Domains", "Cross-Domain Tracking", "HTTPS", "#Remarketing Lists", "#Remarketing"]
  
  $hacks = ["Tricks", "Tips", "Feature", "Features", "Trick", "Tip", "Tips", "Tricks", "Innovation",
    "Innovations", "Tool", "Tools", "Hack", "Hacks", "Update", "Updates", "Change", "Changes"]
  
  $parts = ["is", "Can", "Will", "are", "for", "That Can", "That Will"]

  $verbs = ["Running", "Improving", "Optimizing", "Increasing", "Attracting", "Improve", "Run", "Optimize",
    "Attract", "Increase", "the Future of", "Get", "Getting", "Change", "Changing"]
  
  $buzzwords2 = ["Leads", "Conversions", "PPC", "SEO", "Local Search", "Mobile", "Clicks", "CTR", "Rank", "Ranking",
    "Ranks", "Rankings", "Bing", "CPC", "Bids", "Text Ads", "Display", "Display Network", "Shopping Ads",
    "AdWords", "YouTube Ads", "Social Media", "Outreach", "Link Building", "Ranking Boost", "Boost",
    "Knowledge Box", "Campaigns", "CPA", "CPM", "5-Star Reviews", "Content", "Search", "Remarketing Lists",
    "Remarketing"]
  
  $gratifications = ["For Your Business", "Performance", "In Five Minutes", "Today"]
  
  def initialize()
    #Determine which of the six types of headlines will be generated
    @type = 1 + rand(6)
  end
  
  def getType
    #Getter method: Returns type of headline (1-6)
    @type
  end
  
  def getParts
    #Generate a hash of random headline parts
    parts = Hash.new
    parts["prefix"] = $prefixes[(rand($prefixes.length))-1]
    parts["adjective"] = $adjectives[(rand($adjectives.length))-1]
    parts["buzzword"] = $buzzwords[(rand($buzzwords.length))-1]
    parts["hack"] = $hacks[(rand($hacks.length))-1]
    parts["part"] = $parts[(rand($parts.length))-1]
    parts["verb"] = $verbs[(rand($verbs.length))-1]
    parts["buzzword2"] = $buzzwords2[(rand($buzzwords2.length))-1]
    parts["bait"] = $bait[(rand($bait.length))-1]
    parts["incentive"] = $incentives[(rand($incentives.length))-1]
    parts["question"] = $questions[(rand($questions.length))-1]
    parts["gratification"] = $gratifications[(rand($gratifications.length))-1]
    return parts
  end
  
  def generate
    #generate a headline
   hlineType = self.getType()
   headline = Headline.new(hlineType, "")
   
   case hlineType
   when 1
     headline.setText=(self.genHead1)
   when 2
     headline.setText=(self.genHead2)
   when 3
     headline.setText=(self.genHead3)
   when 4
     headline.setText=(self.genHead4)
   when 5
     headline.setText=(self.genHead5)
   when 6
     headline.setText=(self.genHead6)
   end
   
   return headline
   
  end
  
  #Methods genHead1...genHead6 generate different types of headlines
  def genHead1
    parts = self.getParts
    return "#{parts["prefix"]} #{parts["adjective"]} #{parts["buzzword"]} #{parts["hack"]} #{parts["part"]} #{parts["verb"]} #{parts["buzzword2"]}"
  end
  
  def genHead2
    parts = self.getParts
    return "#{parts["adjective"]} #{parts["buzzword"]} #{parts["hack"]} for #{parts["buzzword2"]}"
  end
  
  def genHead3
    parts = self.getParts
    return "#{parts["adjective"]} #{parts["buzzword"]} #{parts["hack"]} #{parts["gratification"]}"
  end
  
  def genHead4
    parts = self.getParts
    return "#{parts["incentive"]} #{parts["buzzword"]} #{parts["gratification"]}?"
  end
  
  def genHead5
    parts = self.getParts
    return "#{parts["question"]} #{parts["buzzword"]}?"
  end
  
  def genHead6
    parts = self.getParts
    return "#{parts["bait"]} #{parts["buzzword"]}"
  end
  
end