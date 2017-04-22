# TODO optimize for large board sizes
board_len, num_obstacles = [100000, 0]
rQueen, cQueen = [4187, 5068]

def generate_board(size):
    board = []
    for i in range(0, size):
        board.append(size * [None])

    return board


board = generate_board(board_len)
board[rQueen - 1][cQueen - 1] = "Q"

# for row in board:
#     print(row)

dirs = [[1,0],[1,1],[0,1],[-1,1],[-1,0],[-1,-1],[0,-1],[1,-1]]

num_can_attack = 0
for dir in dirs:
    print(dir)
    try:
        # print('dir: ', dir)
        # Input for the queens position is also 1-indexed
        current_q_pos = [rQueen - 1, cQueen - 1]
        next_q_pos    =  [row_idx + col_idx for row_idx,  col_idx in zip(current_q_pos, dir)]
        while board[next_q_pos[0]][next_q_pos[1]] != 'x' and next_q_pos[0] >= 0 and next_q_pos[1] >= 0:
            print(next_q_pos)
            num_can_attack += 1
            next_q_pos      =  [row_idx + col_idx for row_idx, col_idx in zip(next_q_pos, dir)]
    except IndexError:
        # print('Index Error: ', dir)
        continue

print(num_can_attack)
