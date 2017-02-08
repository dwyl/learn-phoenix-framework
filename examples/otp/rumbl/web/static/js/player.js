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

  init(domId, playerId, onReady){
    window.onYouTubeIframeAPIReady = () => {
      this.onIframeReady(domId, playerId, onReady)
    }
    let youtubeScriptTag = document.createElement("script")
    youtubeScriptTag.src = "//www.youtube.com/iframe_api"
    document.head.appendChild(youtubeScriptTag)
  },

  onIframeReady(domId, playerId, onReady){
    this.player = new YT.Player(domId, {
      height: "360",
      width: "420",
      videoId: playerId,
      events: {
        "onReady":  (event => onReady(event) ),
        "onStateChange": (event => this.onPlayerStateChange(event) )
      }
    })
  },

  onPlayerStateChange(event){ },
  getCurrentTime(){ return Math.floor(this.player.getCurrentTime() * 1000) },
  seekTo(millsec){ return this.player.seekTo(millsec / 1000) }
}
export default Player
