/***
 * Excerpted from "Programming Phoenix",
 * published by The Pragmatic Bookshelf.
 * Copyrights apply to this code. It may not be used to create training material,
 * courses, books, articles, and the like. Contact us if you are in doubt.
 * We make no guarantees that this code is fit for any purpose.
 * Visit http://www.pragmaticprogrammer.com/titles/phoenix for more book information.
***/
import Player from "./player"

let Video = {

  init(socket, element){ if(!element){ return }
    let msgContainer = document.getElementById("msg-container")
    let msgInput     = document.getElementById("msg-input")
    let postButton   = document.getElementById("msg-submit")
    let videoId      = element.getAttribute("data-id")
    let playerId     = element.getAttribute("data-player-id")
    Player.init(element.id, playerId)

    let vidChannel   = socket.channel("videos:" + videoId)  

    vidChannel.join()
      .receive("ok", resp => console.log("joined", resp) )
      .receive("error", reason => console.log("join failed", reason) ) 

  }
}
export default Video
