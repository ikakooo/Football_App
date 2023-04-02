//
//  MatchModel.swift
//  Football_App
//
//  Created by Irakli Chkhitunidze on 4/2/23.
//

// MARK: - MatchModel
struct ResponceMatchModel: Codable {
    var httpStatusCode: Int?
    var resultCode: Int?
    var match: MatchModel?
}

// MARK: - Match
struct MatchModel: Codable {
    var team1, team2: TeamModel?
    var matchTime: Double?
    var matchDate: Int?
    var stadiumAdress: String?
    var matchSummary: MatchSummaryModel?
}

// MARK: - MatchSummary
struct MatchSummaryModel: Codable {
    var summaries: [SummaryModel]?
}

// MARK: - Summary
struct SummaryModel: Codable {
    var actionTime: String?
    var team1Action: [TeamActionModel]?
    var team2Action: [TeamActionModel]?
}

// MARK: - Team1Action
struct TeamActionModel: Codable {
    var teamType: MatchTeamType?
    var actionType: MatchActionType?
    var action: TeamActionActionModel?
}

enum MatchActionType: Int, Codable {
    case GOAL = 1
    case YELLOW_CARD = 2
    case RED_CARD = 3
    case SUBSTITUTION = 4
}

enum MatchTeamType:Int, Codable {
    case TEAM1 = 1
    case TEAM2 = 2
}

// MARK: - Team1ActionAction
struct TeamActionActionModel: Codable {
    var player: PlayerModel?
    var goalType: GoalType?
    var player1, player2: PlayerModel?
}

enum GoalType: Int, Codable {
    case GOAL = 1
    case OWN_GOAL = 2
}

// MARK: - PurplePlayer
struct PlayerModel: Codable {
    var playerName: String?
    var playerImage: String?
}

// MARK: - Team
struct TeamModel: Codable {
    var teamName: String?
    var teamImage: String?
    var score, ballPosition: Int?
}

