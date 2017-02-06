/***
 * Excerpted from "Programming Phoenix",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material,
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose.
 * Visit http://www.pragmaticprogrammer.com/titles/phoenix for more book information.
***/
let Player = {
  player: null,
  ready: false,
  onReadyCallbacks: [],

  init(domId, playerId){
    window.onYouTubeIframeAPIReady = () => this.onIframeReady(domId, playerId)
    let youtubeScriptTag = document.createElement("script")
    youtubeScriptTag.src = "//www.youtube.com/iframe_api"
    document.head.appendChild(youtubeScriptTag)
  },

  onReady(cb){ this.ready ? cb() : this.onReadyCallbacks.push(cb) },

  onIframeReady(domId, playerId){
    this.player = new YT.Player(domId, {
      height: "360",
      width: "420",
      videoId: playerId,
      events: {
        "onReady":  ( event => this.onPlayerReady(event) ),
        "onStateChange": ( event => this.onPlayerStateChange(event) )
      }
    })
  },

  onPlayerReady(event){
    this.ready = true
    this.onReadyCallbacks.forEach(cb => cb() )
  },

  onPlayerStateChange(event){ },
  getCurrentTime(){ return Math.floor(this.player.getCurrentTime() * 1000) },
  seekTo(millsec){ return this.player.seekTo(millsec / 1000) }
}
export default Player
