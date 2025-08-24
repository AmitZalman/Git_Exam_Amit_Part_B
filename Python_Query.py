
import psycopg2
import psycopg2.extras

def get_connection():
    return psycopg2.connect(dbname='postgres', user='amitzalman', password='admin',
                            host='localhost', port='5432', cursor_factory=psycopg2.extras.RealDictCursor)

def fetch_query(query: str) -> list:
    conn = get_connection()
    cur = conn.cursor()
    cur.execute(query)
    rows = cur.fetchall()
    conn.commit()
    conn.close()
    return rows

#Q1
def movies():
    rows = fetch_query("SELECT * FROM movies")
    return rows

#Q2

def movie_by_name():
    movie_name = input("please enter your movie name: ").strip()
    conn = get_connection()
    cur = conn.cursor()
    cur.execute("SELECT * FROM movies WHERE movie_name ILIKE %s", (f"%{movie_name}%",))
    rows = cur.fetchall()
    conn.close()
    return rows


#Q3
def insert_movie_by_details():
    movie_name = input("please enter your movie name: ").strip()
    genre = input("please enter the movie genre: ").strip()
    country = input("please enter the country the movie original came from: ").strip()
    language = input("please enter the movie language: ").strip()
    year = int(input("please enter the movie year: "))
    revenue = int(input("please enter the movie revenue in millions: "))


    conn = get_connection()
    cur = conn.cursor()
    cur.execute("""
            INSERT INTO movies (movie_name, genre, country, language, year, revenue)
            VALUES (%s, %s, %s, %s, %s, %s)
        """, (movie_name, genre, country, language, year, revenue))
    conn.commit()
    conn.close()

    print("Movie inserted successfully!")

if __name__ == "__main__":
    insert_movie_by_details()


if __name__ == "__main__":
    results = movies()
    for row in results:
        print(row)
