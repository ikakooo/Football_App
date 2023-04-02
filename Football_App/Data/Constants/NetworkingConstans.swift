//
//  NetworkingConstans.swift
//  Football_App
//
//  Created by Irakli Chkhitunidze on 4/1/23.
//

//MARK: Rest API

let restBaseUrl = "https://www.mocky.io"
let path = "/v2/5b9264193300006b00205fb9"


//MARK: Only for History
let jsonData = """
{
  "resultCode": 1,
  "match": {
    "team1": {
      "teamName": "დინამო",
      "teamImage": "https://cdn.freebiesupply.com/logos/large/2x/dinamo-tbilisi-1-logo-png-transparent.png",
      "score": 3,
      "ballPosition": 54
    },
    "team2": {
      "teamName": "ტორბედო",
      "teamImage": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSQaEvAV2oeFTjwCWVPp_D9NsSr2BjgJ8h03Oa7Dx_mSFWmEt6R",
      "score": 0,
      "ballPosition": 46
    },
    "matchTime": 85.46,
    "matchDate": 1536313435163,
    "stadiumAdress": "დინამო არენა",
    "matchSummary": {
      "summaries": [
        {
          "actionTime": "2",
          "team1Action": [
            {
              "actionType": 1,
              "teamType": 1,
              "action": {
                "player": {
                  "playerName": "მიხეილ ერგემლიძე",
                  "playerImage": "http://fcdinamo.ge/file.helix?i=1e7531a3-3143-4ee0-a6cd-03b70077fff3&r=L&.jpg"
                },
                "goalType": 1
              }
            }
          ]
        },
        {
          "actionTime": "11",
          "team1Action": [
            {
              "actionType": 2,
              "teamType": 1,
              "action": {
                "player": {
                  "playerName": "ლაშა თოთაძე",
                  "playerImage": "http://fcdinamo.ge/file.helix?i=64960a03-0a0e-49f9-8cb2-ea10064b0936&r=L&.jpg"
                }
              }
            }
          ],
          "team2Action": [
            {
              "actionType": 2,
              "teamType": 2,
              "action": {
                "player": {
                  "playerName": "გიორგი კუხიანიძე"
                }
              }
            }
          ]
        },
        {
          "actionTime": "25",
          "team1Action": [
            {
              "actionType": 4,
              "teamType": 1,
              "action": {
                "player1": {
                  "playerName": "გიორგი ივანიშვილი",
                  "playerImage": "http://fcdinamo.ge/file.helix?i=15f84300-1e3e-40bf-b69c-1f012803039a&r=L&.jpg"
                },
                "player2": {
                  "playerName": "მიხეილ ერგემლიძე",
                  "playerImage": "http://fcdinamo.ge/file.helix?i=1e7531a3-3143-4ee0-a6cd-03b70077fff3&r=L&.jpg"
                }
              }
            }
          ],
          "team2Action": [
            {
              "actionType": 2,
              "teamType": 2,
              "action": {
                "player": {
                  "playerName": "გიორგი ქიმაძე"
                }
              }
            }
          ]
        },
        {
          "actionTime": "33",
          "team2Action": [
            {
              "actionType": 1,
              "teamType": 2,
              "action": {
                "player": {
                  "playerName": "მამუკა კობახიძე"
                },
                "goalType": 2
              }
            }
          ]
        },
        {
          "actionTime": "40",
          "team1Action": [
            {
              "actionType": 4,
              "teamType": 1,
              "action": {
                "player1": {
                  "playerName": "ბუდუ ზივზივაძე",
                  "playerImage": "http://fcdinamo.ge/file.helix?i=e3cc3c2e-10c3-445b-9016-29d88a3d94c6&r=L&.jpg"
                },
                "player2": {
                  "playerName": "თამაზ ბაბუნაძე",
                  "playerImage": "http://fcdinamo.ge/file.helix?i=c5cffb6b-c087-48d5-a574-88255a062cff&r=L&.jpg"
                }
              }
            },
            {
              "actionType": 4,
              "teamType": 1,
              "action": {
                "player1": {
                  "playerName": "სტეპან სიკაჩი",
                  "playerImage": "http://fcdinamo.ge/file.helix?i=302956a2-c6f9-4fc5-9c14-1a11b3dd85d5&r=L&.jpg"
                },
                "player2": {
                  "playerName": "დემეტრე ბულისკერია",
                  "playerImage": "http://fcdinamo.ge/file.helix?i=96953410-6306-481e-b973-dbc9cda57191&r=L&.jpg"
                }
              }
            }
          ],
          "team2Action": [
            {
              "actionType": 2,
              "teamType": 2,
              "action": {
                "player": {
                  "playerName": "ლევან კუტალია"
                }
              }
            }
          ]
        },
        {
          "actionTime": "73",
          "team1Action": [
            {
              "actionType": 3,
              "teamType": 1,
              "action": {
                "player": {
                  "playerName": "ბუდუ ზივზივაძე",
                  "playerImage": "http://fcdinamo.ge/file.helix?i=e3cc3c2e-10c3-445b-9016-29d88a3d94c6&r=L&.jpg"
                }
              }
            }
          ]
        },
        {
          "actionTime": "83",
          "team1Action": [
            {
              "actionType": 1,
              "teamType": 1,
              "action": {
                "player": {
                  "playerName": "მიხეილ ერგემლიძე",
                  "playerImage": "http://fcdinamo.ge/file.helix?i=1e7531a3-3143-4ee0-a6cd-03b70077fff3&r=L&.jpg"
                },
                "goalType": 1
              }
            }
          ],
          "team2Action": [
            {
              "actionType": 4,
              "teamType": 2,
              "action": {
                "player1": {
                  "playerName": "მილოსი ლაკიმი"
                },
                "player2": {
                  "playerName": "გიორგი კუხიანიძე"
                }
              }
            }
          ]
        }
      ]
    }
  }
}
"""
