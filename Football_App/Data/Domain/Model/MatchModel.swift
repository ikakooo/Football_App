//
//  MatchModel.swift
//  Football_App
//
//  Created by Irakli Chkhitunidze on 4/2/23.
//

// MARK: - MatchModel
struct MatchModel: Codable {
    var httpStatusCode: Int?
    var resultCode: Int?
    var match: Match?
}

// MARK: - Match
struct Match: Codable {
    var team1, team2: Team?
    var matchTime: Double?
    var matchDate: Int?
    var stadiumAdress: String?
    var matchSummary: MatchSummary?
}

// MARK: - MatchSummary
struct MatchSummary: Codable {
    var summaries: [Summary]?
}

// MARK: - Summary
struct Summary: Codable {
    var actionTime: String?
    var team1Action: [Team1Action]?
    var team2Action: [Team2Action]?
}

// MARK: - Team1Action
struct Team1Action: Codable {
    var actionType, teamType: Int?
    var action: Team1ActionAction?
}

// MARK: - Team1ActionAction
struct Team1ActionAction: Codable {
    var player: PurplePlayer?
    var goalType: Int?
    var player1, player2: PurplePlayer?
}

// MARK: - PurplePlayer
struct PurplePlayer: Codable {
    var playerName: String?
    var playerImage: String?
}

// MARK: - Team2Action
struct Team2Action: Codable {
    var actionType, teamType: Int?
    var action: Team2ActionAction?
}

// MARK: - Team2ActionAction
struct Team2ActionAction: Codable {
    var player: FluffyPlayer?
    var goalType: Int?
    var player1, player2: FluffyPlayer?
}

// MARK: - FluffyPlayer
struct FluffyPlayer: Codable {
    var playerName: String?
}

// MARK: - Team
struct Team: Codable {
    var teamName: String?
    var teamImage: String?
    var score, ballPosition: Int?
}

