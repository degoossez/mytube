<?php
 ini_set('display_errors','off');
class uploadModel extends Model
{
    public function getNews()
    {
        $sql = "SELECT
                    a.id,
                    a.title,
                    a.path
                FROM 
                    movies a";
         
        $this->_setSql($sql);
        $articles = $this->getAll();
         
        if (empty($articles))
        {
            return false;
        }
         
        return $articles;
    }
     
    public function getArticleById($id)
    {
        $sql = "SELECT
                    a.title
                FROM 
                    movies a";
         
        $this->_setSql($sql);
        $articleDetails = $this->getRow(array($id));
         
        if (empty($articleDetails))
        {
            return false;
        }
         
        return $articleDetails;
    }
}
