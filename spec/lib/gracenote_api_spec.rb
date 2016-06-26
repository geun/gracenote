require "spec_helper"

describe Gracenote do 

  let(:gn) { Gracenote.new({:client_id => "7097600", :client_tag => "35312F0A797B9FE6F24AC32CDE64AC5B", :user_id => "259611531832193638-19110695509BAD8C550883C21A289003"}) }

  describe "track_api" do
    before do 
      VCR.insert_cassette 'track_find', :record => :new_episodes
    end

    after do 
      VCR.eject_cassette
    end
  
    it "must have a find_track method" do
      gn.should respond_to :find_track
    end

    it "records new track fixture" do
      gn.find_track("Kings Of Convenience", "Riot On An Empty Street", "Homesick", '0')
    end

    it "returns result for find_track query" do
      gn.find_track("Kings Of Convenience", "Riot On An Empty Street", "Homesick", '0').should_not == nil
    end
  end

  describe "find_tv_show" do
    before do 
      VCR.insert_cassette 'tvshow_find', :record => :new_episodes
    end

    after do 
      VCR.eject_cassette
    end
    
    it "must have a find_tv_show method" do
      gn.should respond_to :find_tv_show
    end
    
    it "records new tv show fixture" do
      gn.find_tv_show('saved by the bell').inspect
    end

    it "returns result for find_tv_show query" do
      gn.find_tv_show('saved by the bell').inspect.should_not == nil
    end
  end

  describe "fetch_tv_show" do
    before do 
      VCR.insert_cassette 'tvshow_fetch', :record => :new_episodes
    end

    after do 
      VCR.eject_cassette
    end

    it "must have a fetch_tv_show method" do
      gn.should respond_to :fetch_tv_show
    end

    it "records fetching a tv show" do 
      gn.fetch_tv_show('238078046-4B86F4187EE2D215784CE4266CB83EA9')
    end

    it "returns result for fetch_tv_show query" do
      gn.fetch_tv_show('238078046-4B86F4187EE2D215784CE4266CB83EA9').should_not == nil
    end
  end

  describe "fetch_season" do
    before do 
      VCR.insert_cassette 'tvshow_fetch_season', :record => :new_episodes
    end

    after do 
      VCR.eject_cassette
    end    

    it "must have a fetch_season method" do
      gn.should respond_to :fetch_season
    end

    it "records fetching a season" do
      gn.fetch_season('238050049-B36CFD6F8B6FC76E2174F2A6E22515CD')
    end

    it "returns result for fetch_season query" do
      gn.fetch_season('238050049-B36CFD6F8B6FC76E2174F2A6E22515CD').should_not == nil
    end
  end

  describe "find_contributor" do
    before do 
      VCR.insert_cassette 'tvshow_find_contributor', :record => :new_episodes
    end

    after do 
      VCR.eject_cassette
    end    

    it "must have a find_contributor method" do
      gn.should respond_to :find_contributor
    end

    it "records finding a contributor" do 
      gn.find_contributor('vince vaughn')
    end

    it "returns result for find_contributor query" do
      gn.find_contributor('vince vaughn').should_not == nil
    end
  end

  describe "fetch_contributor" do
    before do 
      VCR.insert_cassette 'tvshow_fetch_contributor', :record => :new_episodes
    end

    after do 
      VCR.eject_cassette
    end    

    it "must have a fetch_contributor method" do
      gn.should respond_to :fetch_contributor
    end

    it "records finding a contributor using gn_id" do
      gn.fetch_contributor('238498181-193BE2BA655E1490A3B8DF3ACCACEF3A')
    end

    it "returns result for fetch_contributor query" do
      gn.fetch_contributor('238498181-193BE2BA655E1490A3B8DF3ACCACEF3A').should_not == nil
    end
  end
end