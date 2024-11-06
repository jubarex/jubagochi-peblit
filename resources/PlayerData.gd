extends Resource
class_name PlayerData


@export var gold: int = 12

@export var ScoresFlappy: Array[int] = [0]
@export var ScoresEstrela: Array[int] = [0]

func setGold(new_gold:int):
	gold = new_gold
	
func addGold(value:int):
	gold += value
	
func addScoreFlappy(score:int):
	ScoresFlappy.append(score)
	ScoresFlappy.sort_custom(sort_descending)
	if(ScoresFlappy.size() > 10):
		ScoresFlappy.resize(10)
	
func printScoreFlappy():
	for a in ScoresFlappy:
		print(str(a))	

func addScoreEstrela(score:int):
	ScoresEstrela.append(score)
	ScoresEstrela.sort_custom(sort_descending)
	if(ScoresEstrela.size() > 10):
		ScoresEstrela.resize(10)
	
func printScoreEstrela():
	for a in ScoresEstrela:
		print(str(a))	

func sort_descending(a, b):
	if a > b:
		return true
	return false
