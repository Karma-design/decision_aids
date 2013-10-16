
# The problem's configuration (criterias, matrix, weights, )
CRITERES = ['g1', 'g2', 'g3', 'g4']

M = {'a': dict(g1=6, g2=5, g3=5, g4=5),
     'b': dict(g1=5, g2=4, g3=9, g4=3),
     'd': dict(g1=3, g2=7, g3=5, g4=4),
     'e': dict(g1=5, g2=6, g3=2, g4=9),
     'h': dict(g1=3, g2=5, g3=7, g4=4)
}
#'c': dict(g1=3, g2=4, g3=7, g4=3),
#'f': dict(g1=2, g2=5, g3=7, g4=3),
#'g': dict(g1=5, g2=6, g3=2, g4=7),

POIDS = dict(g1=1, g2=1, g3=1, g4=1)
ECHELLE = 10

def draw_matrix(func):
    print '{}'.format(func.func_name.upper())
    
    print '  ',
    for a in sorted(M.keys()):
        print '{} '.format(a),
    print ''
    
    for a in sorted(M.keys()):
        print '{} '.format(a),
        for b in sorted(M.keys()):
            print '{} '.format(func(a,b)) if a != b else '. ',
        print ''
    print ''

def concordance(a,b):
    return sum((M[a][c] >= M[b][c]) * POIDS[c] for c in CRITERES)
def discordance(a,b):
    return max( max(M[b][c] - M[a][c], 0) for c in CRITERES)

# dominants = [(A, B) for A in M for B in M if A != B and concordance(A, B) >= CONCORD_L and discordance(A,B) <= DISCORD_L]
def dominance(seuil_concord, seuil_discord):
    print 'Dominance pour un seuil de concordance de {} et un seuil de discordance de {}:'.format(seuil_concord, seuil_discord)
    for a in M:
        domine = [b for b in M if b != a and concordance(a, b) >= seuil_concord and discordance(a, b) <= seuil_discord]
        if domine:
            print '  . {} domine {}'.format(a, ', '.join(domine))
            print ''

draw_matrix(concordance)
draw_matrix(discordance)

for (conc_l, disc_l) in [(2, 3), (3, 3), (3, 4), (2, 4), (2, 1)]:
    dominance(conc_l, disc_l)