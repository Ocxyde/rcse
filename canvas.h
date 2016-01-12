#ifndef CANVAS_H
#define CANVAS_H

#include <QGraphicsScene>
#include <QGraphicsItem>
#include "field.h"
#include "fieldmodel.h"

class Canvas : public QGraphicsScene
{
    Q_OBJECT
public:
    enum Tool {ADD,MOVE,DELETE};
    explicit Canvas(QObject *parent = 0);

    void setCurrentTool(Canvas::Tool);
    FieldModel *model() const;
    void setModel(FieldModel *model);

protected:
    void dragEnterEvent ( QGraphicsSceneDragDropEvent * event );
    void dropEvent ( QGraphicsSceneDragDropEvent * event );
    void dragMoveEvent( QGraphicsSceneDragDropEvent * event );
    void mousePressEvent(QGraphicsSceneMouseEvent *mouseEvent);
    void mouseMoveEvent(QGraphicsSceneMouseEvent *mouseEvent);
    void mouseReleaseEvent(QGraphicsSceneMouseEvent *mouseEvent);
private:
    QGraphicsItem* m_bg;
    Field* m_currentItem;
    Tool m_currentTool;
    FieldModel* m_model;
};

#endif // CANVAS_H
